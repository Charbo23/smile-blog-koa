const fs = require('fs');
const UFile = require('@charbo/ufile-node-sdk');
const qiniu = require('qiniu');
const chalk = require('chalk');


class ufileUpLoader {
  constructor({ prefix, unique = true }) {
    this.prefix = prefix || ''
    const { ufile: ufileConfig } = global.config;
    this.ufile = new UFile(ufileConfig);
    this.unique = !!unique ? parseInt(Date.now() / 1000) : unique;
  }
  async upload(files) {
    let promises = [];
    try {
      Object.keys(files).forEach((key) => {
        const file = files[key];
        const filePath = file.path;
        const fileRename = file.originalFilename;
        const promise = new Promise((resolve, reject) => {
          this.ufile.putFile({ filePath, prefix: this.prefix, fileRename, unique: this.unique })
            .then(({ url }) => {
              resolve(url);
              deleteFile(filePath);
            })
            .catch((error) => {
              reject(error);
              deleteFile(filePath);
            })
        })
        promises.push(promise)
      });
      return Promise.all(promises)
    } catch (error) {
      console.log(error);
      throw new Error('文件上传失败')
    }
  }
}

class qiniuUploader {
  constructor({ prefix = '', unique = true }) {
    this.prefix = !prefix || prefix.endsWith('/') ? prefix : prefix + '/';
    this.unique = unique;
  }
  async upload(files) {
    // 上传凭证
    const accessKey = global.config.qiniu.accessKey
    const secretKey = global.config.qiniu.secretKey
    const bucket = global.config.qiniu.bucket
    let siteDomain = global.config.qiniu.siteDomain

    let promises = []

    for (const file of files) {
      let filename = file.filename;
      if (this.unique) {
        const id = parseInt(Date.now() / 1000);
        const filenameArr = filename.split('.');
        filename = `${filenameArr[0]}_${id}.${filenameArr[filenameArr.length - 1]}`;
      }
      const key = this.prefix + filename;
      // 文件覆盖
      const putPolicy = new qiniu.rs.PutPolicy({
        scope: `${bucket}:${key}`
      })
      const mac = new qiniu.auth.digest.Mac(accessKey, secretKey)
      const uploadToken = putPolicy.uploadToken(mac)

      // ReadableStream 对象的上传
      const config = new qiniu.conf.Config()
      // config.zone = qiniu.zone.Zone_z0
      config.useHttpsDomain = true

      const formUploader = new qiniu.form_up.FormUploader(config)
      const putExtra = new qiniu.form_up.PutExtra()
      const readableStream = file
      console.log(chalk.blue('INFO'), ('Uploading...'));
      const promise = new Promise((resolve, reject) => {
        formUploader.putStream(uploadToken, key, readableStream, putExtra, (respErr, respBody, respInfo) => {
          if (respErr) {
            reject(respErr)
          }
          if (respInfo.statusCode === 200) {
            siteDomain = siteDomain.endsWith('/') ? siteDomain : siteDomain + '/';
            const url = siteDomain + respBody.key
            resolve(url)
            console.log(chalk.green('SUCCESS'), ('Upload Complete\n'));
          } else {
            // 614 文件已存在
            reject(respInfo)
          }
        })
      })
      promises.push(promise)
    }
    try {
      return Promise.all(promises)
    } catch (error) {
      throw new Error('文件上传失败')
    }
  }
}

const deleteFile = (path) => {
  fs.unlink(path, (err) => {
    if (err) {
      console.log(err);
    } else {

    }
  });
}
module.exports = {
  ufileUpLoader,
  qiniuUploader
}