const { Success } = require('@exception')
const nanoid = require('nanoid')

function success(msg, errorCode) {
  throw new Success(msg, errorCode)
}

function uuid(length = 10) {
  return nanoid(length);
}
module.exports = {
  success,
  uuid
}