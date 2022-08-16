'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Category extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }

    static addCategory({ categoryID, categoryName }){
      return this.create({ 
        categoryID: categoryID,
        categoryName: categoryName }); 
    }

    static deleteCategory(id){
      return this.destroy({ where: { id: id } })
    }

  }
  Category.init({
    categoryID: DataTypes.STRING,
    categoryName: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'Category',
  });
  return Category;
};