const { sequelize } = require('../../core/db')
const { Sequelize, Model } = require('sequelize')

class ArticleAuthor extends Model {

}

ArticleAuthor.init({
  id: {
    type: Sequelize.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  article_id: {
    type: Sequelize.INTEGER,
    allowNull: false
  },
  author_id: {
    type: Sequelize.INTEGER,
    allowNull: false
  }
}, {
  sequelize,
  tableName: 'articleAuthor'
})

module.exports = {
  ArticleAuthor
}