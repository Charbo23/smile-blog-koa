const { Author } = require('@models/author')
const { AuthFailed, Forbidden } = require('@exception')
const bcrypt = require('bcryptjs')

class AuthorDao {
  async createAuthor(v) {
    const name = v.get('body.name')
    const author = await Author.findOne({
      where: {
        name
      }
    })
    if (author) {
      throw new Forbidden({
        msg: '已存在该作者名'
      })
    }
    await Author.create({
      name: v.get('body.name'),
      avatar: v.get('body.avatar'),
      email: v.get('body.email'),
      description: v.get('body.description'),
      password: v.get('body.password'),
      auth: v.get('body.auth')
    })
  }

  async verifyEmailPassword(ctx, name, password) {
    const author = await Author.findOne({
      where: {
        name
      }
    })
    if (!author) {
      throw new AuthFailed('作者不存在')
    }
    const correct = bcrypt.compareSync(password, author.password)
    if (!correct) {
      throw new AuthFailed('密码不正确')
    }
    
    return author
  }
}

module.exports = {
  AuthorDao
}