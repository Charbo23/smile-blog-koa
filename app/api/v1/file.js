const Router = require('koa-router')

const { UpLoader } = require('../../lib/upload')
const { Auth } = require('../../../middleware/auth')
const multiparty = require('koa2-multiparty');

const fileApi = new Router({
  prefix: '/v1/file'
})

// fileApi.post('/', new Auth().m, async (ctx) => {
//   const files = await ctx.multipart()
//   const upLoader = new UpLoader(`blog/`)
//   const arr = await upLoader.upload(files)
//   // 此处将返回Url数组，因为有await关键字，相当于调用then
//   ctx.body = arr
// })

fileApi.post('/', multiparty(), async (ctx) => {
  const files = ctx.req.files;
  const upLoader = new UpLoader(`blog/`);
  const arr = await upLoader.upload(files,ctx.req.body.file_id);
  // console.log(arr);
  // 此处将返回Url数组，因为有await关键字，相当于调用then
  ctx.body = arr
})
module.exports = fileApi