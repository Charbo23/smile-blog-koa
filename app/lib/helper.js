const fs = require('fs');
const { Success } = require('@exception')
const nanoid = require('nanoid')

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

    configPath = process.env.NODE_ENV === 'development' && fs.existsSync(devConfigPath) ?
      devConfigPath : prodConfigPath;
  }

  config = require(configPath);

  return config;
}
module.exports = {
  success,
  uuid,
  loadConfig
}