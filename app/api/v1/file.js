const Router = require('koa-router')
const fs = require('fs');

const { uuid, loadConfig } = require('../../lib/helper');
const { ufileUploader, qiniuUploader } = require('../../lib/upload')
const { Auth } = require('../../../middleware/auth')
const multiparty = require('koa2-multiparty');

const getFileUploader = (storeVendor) => {
  let uploader;
  switch (storeVendor) {
    case 'ufile':
      uploader = new ufileUploader();
      break;
    case 'qiniu':
      uploader = new qiniuUploader()
      break;
    default:
      uploader = new qiniuUploader()
  }
  return uploader;
}

const { storeVendor } = loadConfig();
console.log(`files will be uploaded to ${storeVendor}`);

const storeConfig = {
  prefix: 'cbsmile/avatar',
  unique: true
}
const fileApi = new Router({
  prefix: '/v1/file'
});

fileApi.post('/', storeVendor === 'ufile' ? multiparty() : new Auth().m, async (ctx) => {
  const files = storeVendor === 'ufile' ? ctx.req.files : await ctx.multipart();
  const uploader = getFileUploader(storeVendor);
  const arr = await uploader.upload(files, storeConfig);
  // console.log(arr);
  // 此处将返回Url数组，因为有await关键字，相当于调用then
  ctx.body = arr;
})

const renameFile = (files) => {
  let renamePromises = []
  try {
    Object.keys(files).forEach((key) => {
      const file = files[key];
      //重命名文件为源文件名
      fileNameArr = file.originalFilename.split('.');
      const filePath = `${file.path.substring(0, file.path.lastIndexOf('\\'))}\\${fileNameArr[0]}_${uuid()}.${fileNameArr[1]}`;
      // const filePath = `./temp/${fileNameArr[0]}_${uuid()}.${fileNameArr[1]}`;
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