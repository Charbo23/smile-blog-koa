const requireDirectory = require('require-directory');
const Router = require('koa-router');
const fs = require('fs');

const devConfigPath = `${process.cwd()}/config/config-dev.js`;
const prodConfigPath = `${process.cwd()}/config/config.js`;

class InitManager {
  static initCore(app) {
    // 入口
    InitManager.app = app
    InitManager.initLoadRoutes()
    InitManager.loadConfig(
      process.env.NODE_ENV === 'development' && fs.existsSync(devConfigPath) ?
        devConfigPath : prodConfigPath
    );
  }

  static loadConfig(configPath = prodConfigPath) {
    const config = require(configPath)
    global.config = config
  }

  static initLoadRoutes() {
    const appDirectory = `${process.cwd()}/app/api`
    requireDirectory(module, appDirectory, {
      visit: whenLoadingModule
    })

    function whenLoadingModule(obj) {
      if (obj instanceof Router) {
        InitManager.app.use(obj.routes())
      }
    }
  }
}

module.exports = InitManager