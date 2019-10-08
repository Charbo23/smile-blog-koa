const { sequelize } = require('../../core/db')
const { Sequelize, Model } = require('sequelize')

class ArticleTag extends Model {
  
}

ArticleTag.init({
  id: {
    type: Sequelize.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  article_id: {
    type: Sequelize.INTEGER,
    allowNull: false
  },
  tag_id: {
    type: Sequelize.INTEGER,
    allowNull: false
  }
}, {
  sequelize,
  tableName: 'articleTag'
})

module.exports = {
  ArticleTag
}