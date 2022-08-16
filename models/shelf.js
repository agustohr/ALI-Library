'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Shelf extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }

    static addShelf({ shelfName }){
      return this.create({ 
        shelf: shelfName }); 
    }

    static deleteShelf(id){
      return this.destroy({ where: { id: id } })
    }
  }
  Shelf.init({
    shelfName: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'Shelf',
  });
  return Shelf;
};