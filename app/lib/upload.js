const path = require('path');
const fs = require('fs');
const UFile = require('@charbo/ufile-node-sdk');
const config = require(path.resolve(process.cwd(), ('./ufile-config')));

const ufile = new UFile(config);

class UpLoader {
  async upload(files, file_id) {
    let promises = [];
    try {
      Object.keys(files).forEach((key) => {
        const file = files[key];
        const filePath = file.path;
        const fileRename = file.originalFilename;
        const prefix = 'smile-blog';
        const promise = new Promise((resolve, reject) => {
          ufile.putFile({ filePath, prefix, fileRename, unique: parseInt(Date.now() / 1000) })
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