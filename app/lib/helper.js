const fs = require('fs');
const { Success } = require('../../core/http-exception')
const nanoid = require('nanoid')
const _ = require('lodash');

function success(msg, errorCode) {
  throw new Success(msg, errorCode)
}

function uuid(length = 10) {
  return nanoid(length);
}

function loadConfig(configPath) {
  let config;
  if (!configPath) {
    const devConfigPath = `${process.cwd()}/config/config-dev.js`;
    const prodConfigPath = `${process.cwd()}/config/config.js`;

    configPath = process.env.NODE_ENV === 'production' || !fs.existsSync(devConfigPath) ?
      prodConfigPath : devConfigPath;
  }

  config = require(configPath);
  
  return config;
}

const throwError = (error) => {
  if (_.isError(error)) {
    throw (error)
  } else {
    //格式化错误输出
    throw (new Error(JSON.stringify(error, null, 2)))
  }
}

module.exports = {
  success,
  uuid,
  loadConfig,
  throwError
}