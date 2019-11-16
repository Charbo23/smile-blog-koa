const requireDirectory = require('require-directory');
const Router = require('koa-router');
const { loadConfig } = require('../app/lib/helper');


class InitManager {
  static initCore(app) {
    // 入口
    //访问静态变量不能用this
    InitManager.app = app;
    this.initLoadRoutes();
    this.initConfig();
  }

  static initConfig(configPath) {
    const config = loadConfig(configPath);
    global.config = config;
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