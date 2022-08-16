'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Alert extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }

    //fungsi untuk menambahkan Alert
    static addAlert({ receiverName, senderId, senderName, id_item, title, text }){
      return this.create({ 
        receiverName: receiverName,
        senderId: senderId, 
        senderName: senderName,
        id_item: id_item, 
        title: title, 
        text: text }); 
    }

    //fungsi untuk delete Alert
    static deleteAlert(id){
      return this.destroy({ where: { id: id } })
    }

    //fungsi untuk update Alert
    static updateAlert({ receiverName, senderId, senderName, id_item, title, text },id){
      return this.update({ 
        receiverName: receiverName,
        senderId: senderId, 
        senderName: senderName,
        id_item: id_item, 
        title: title, 
        text: text }, { where:{id: id} })
    }

    //fungsi untuk mengambil data Alert berdasarkan id
    static getAlertById(id){
      return this.findOne({ where: { id: id } });
    }
  }
  Alert.init({
    receiverName: DataTypes.STRING,
    senderId: DataTypes.STRING,
    senderName: DataTypes.STRING,
    id_item: DataTypes.STRING,
    title: DataTypes.STRING,
    text: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'Alert',
  });
  return Alert;
};