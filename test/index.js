const should = require('should');
const fs = require('fs');
const path = require('path');

const { throwError, loadConfig } = require('../app/lib/helper');
const { qiniuUploader, ufileUploader } = require('../app/lib/upload');

const { qiniu: qiniuConfig, ufile: ufileConfig } = loadConfig();
// const uploader = new qiniuUploader(qiniuConfig);
const uploader = new ufileUploader(ufileConfig);

const RunTest = function () {
  this.timeout(5000);
  it('PutFile', PutFile);
};

const PutFile = async function () {
  this.timeout(20000);
  try {
    const prefix = 'test';
    const filePath = ['./test/img/test.png', './test/img/about.jpg'];
    files = filePath.map((item) => {
      const file = fs.createReadStream(item);
      file.filename = path.basename(item);
      return file;
    })
    const res = await uploader.upload(files, { prefix, deleteAfter: false });
    console.log(res);
  } catch (error) {
    throwError(error)
  }
}

describe('UFile SDK Test', RunTest);


