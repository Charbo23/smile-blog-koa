const fs = require('fs');
const UFile = require('@charbo/ufile-node-sdk');

class UpLoader {
  constructor(prefix) {
    this.prefix = prefix || ''
    const { ufile: ufileConfig } = global.config;
    this.ufile = new UFile(ufileConfig);
  }
  async upload(files, file_id) {
    let promises = [];
    try {
      Object.keys(files).forEach((key) => {
        const file = files[key];
        const filePath = file.path;
        const fileRename = file.originalFilename;
        const promise = new Promise((resolve, reject) => {
          this.ufile.putFile({ filePath, prefix: this.prefix, fileRename, unique: parseInt(Date.now() / 1000) })
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