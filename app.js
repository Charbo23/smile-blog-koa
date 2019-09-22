require('module-alias/register')

const Koa = require('koa')
const parser = require('koa-bodyparser')
const InitManager = require('./core/init')
const catchError = require('./middleware/exception')
const cors = require('koa2-cors');
const multipart = require('./core/multipart')
const AV = require('leanengine');

AV.init({
  appId: process.env.LEANCLOUD_APP_ID,
  appKey: process.env.LEANCLOUD_APP_KEY,
  masterKey: process.env.LEANCLOUD_APP_MASTER_KEY
});

// 如果不希望使用 masterKey 权限，可以将下面一行删除
AV.Cloud.useMasterKey();

const app = new Koa()

app.use(cors())
app.use(catchError)
app.use(parser())
multipart(app)

InitManager.initCore(app)

app.listen(3000, () => {
  console.log('listening port 3000')
})