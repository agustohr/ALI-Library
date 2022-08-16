'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Author extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }

    static addAuthor({ author }){
      return this.create({ 
        author: author }); 
    }

    static deleteAuthor(id){
      return this.destroy({ where: { id: id } })
    }
  }
  Author.init({
    author: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'Author',
  });
  return Author;
};