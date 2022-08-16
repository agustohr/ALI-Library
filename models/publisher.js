'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Publisher extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }

    static addPublisher({ publisher }){
      return this.create({ 
        publisher: publisher }); 
    }

    static deletePublisher(id){
      return this.destroy({ where: { id: id } })
    }
  }
  Publisher.init({
    publisher: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'Publisher',
  });
  return Publisher;
};