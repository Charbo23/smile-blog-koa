const Router = require('koa-router')
const fs = require('fs');
const shortid=require('shortid');

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

  await renameFile(files)

  const arr = await upLoader.upload(files, ctx.req.body.file_id);
  // console.log(arr);
  // 此处将返回Url数组，因为有await关键字，相当于调用then
  ctx.body = arr
})
const renameFile = (files) => {
  let renamePromises = []
  try {
    Object.keys(files).forEach((key) => {
      const file = files[key];
      //重命名文件为源文件名
      fileNameArr = file.originalFilename.split('.');
      const filePath = `${file.path.substring(0, file.path.lastIndexOf('\\'))}\\${fileNameArr[0]}_${shortid.generate()}.${fileNameArr[1]}`;
      // const filePath = `./temp/${fileNameArr[0]}_${shortid.generate()}.${fileNameArr[1]}`;
      // console.log(file);
      const readStream = fs.createReadStream(file.path);
      const writeStream = fs.createWriteStream(filePath);
      const promise = new Promise((resolve, reject) => {
        readStream.pipe(writeStream);
        readStream.on('end', function () {
          fs.unlinkSync(file.path);
          file.path = filePath;
          resolve()
        });
      });
      renamePromises.push(promise)
    });
  } catch (error) {
    console.log(error);
    reject(error);
  }
  return Promise.all(renamePromises)
}
module.exports = fileApi