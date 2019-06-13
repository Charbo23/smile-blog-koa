require('module-alias/register')

const Koa = require('koa')
const parser = require('koa-bodyparser')
const InitManager = require('./core/init')
const catchError = require('./middleware/exception')

const app = new Koa()

app.use(catchError)
app.use(parser())

InitManager.initCore(app)

app.listen(3000, () => {
  console.log('listening port 3000')
})