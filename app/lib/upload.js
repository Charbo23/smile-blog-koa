const qiniu = require('qiniu')
const axios = require('axios')
const FormData = require('form-data');
const fs = require('fs');
class UpLoader {
  constructor(prefix) {
    this.prefix = prefix || ''
  }

  // async upload(files) {
  //   // 上传凭证
  //   const accessKey = global.config.qiniu.accessKey
  //   const secretKey = global.config.qiniu.secretKey
  //   const bucket = global.config.qiniu.bucket
  //   const siteDomain = global.config.qiniu.siteDomain

  //   let promises = []

  //   for (const file of files) {
  //     const key = this.prefix + file.filename
  //     // 文件覆盖
  //     const putPolicy = new qiniu.rs.PutPolicy({
  //       scope: `${bucket}:${key}`
  //     })
  //     const mac = new qiniu.auth.digest.Mac(accessKey, secretKey)
  //     const uploadToken = putPolicy.uploadToken(mac)

  //     // ReadableStream 对象的上传
  //     const config = new qiniu.conf.Config()
  //     config.zone = qiniu.zone.Zone_z2
  //     config.useHttpsDomain = true

  //     const formUploader = new qiniu.form_up.FormUploader(config)
  //     const putExtra = new qiniu.form_up.PutExtra()
  //     const readableStream = file

  //     const promise = new Promise((resolve, reject) => {
  //       formUploader.putStream(uploadToken, key, readableStream, putExtra, (respErr, respBody, respInfo) => {
  //         if (respErr) {
  //           reject(respErr)
  //         }

  //         if (respInfo.statusCode === 200) {
  //           const url = siteDomain + respBody.key
  //           resolve(url)
  //         } else {
  //           // 614 文件已存在
  //           reject(respInfo)
  //         }
  //       })
  //     })
  //     promises.push(promise)
  //   }

  //   try {
  //     return Promise.all(promises)
  //   } catch (error) {
  //     throw new Error('文件上传失败')
  //   }
  // }
  async upload(files, file_id) {
    // 上传凭证
    const AUTH_TOKEN = 'EZdNGdpoofR34iLFtI6IleRfuU7tpM6A';
    axios.defaults.baseURL = 'https://sm.ms/api/v2';
    axios.defaults.headers.common['Authorization'] = AUTH_TOKEN;
    let promises = [];
    try {
      Object.keys(files).forEach((key) => {
        const file = files[key];
        let formData = new FormData();
        //重命名文件为源文件名
        const filePath = `${file.path.substring(0, file.path.lastIndexOf('\\'))}\\${file.originalFilename}`;
        fs.renameSync(file.path, filePath);
        formData.append('smfile', fs.createReadStream(filePath));
        formData.append('file_id', file_id || 0);

        const promise = new Promise((resolve, reject) => {
          axios({
            method: 'post',
            url: '/upload',
            headers: formData.getHeaders(),
            data: formData
          })
            .then((res) => {
              const msg = res.data.message;
              if (res.data.success) {
                resolve(res.data.data.url);
              } else if (msg.indexOf('repeated') !== -1) {
                //如果重复则返回存在图片的地址
                resolve(msg.substring(msg.indexOf('http')));
              } else {
                reject(msg);
              }
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
const deleteFile = (path) => {
  fs.unlink(path, (err) => {
    if (err) {
      console.log(err);
    } else {

    }
  });
}
module.exports = {
  UpLoader
}