'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Borrow extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      this.Borrow = this.belongsTo(models.Users, {
        foreignKey: 'user_id'
      })

      this.Borrow = this.belongsTo(models.Items, {
        foreignKey: 'item_id'
      })
    }

    //fungsi untuk menambahkan Borrow
    static addBorrow({ id_borrow, user_id, user_name, item_id, item_title, code, request_date, booking_admin_id, booking_date,  borrow_admin_id, borrow_date, return_admin_id, return_date, cancel_admin_id, cancel_date, due_date, request_extend_date, action_extend_admin_id, action_extend_date, extend_due_date, borrow_status, extend_status, return_status}){
      return this.create({ 
        id_borrow: id_borrow,
        user_id: user_id, 
        user_name: user_name,
        item_id: item_id, 
        item_title: item_title,
        code: code, 
        request_date: request_date,
        booking_admin_id: booking_admin_id,
        booking_date: booking_date, 
        borrow_admin_id: borrow_admin_id,
        borrow_date: borrow_date,
        return_admin_id: return_admin_id, 
        return_date: return_date,
        cancel_admin_id: cancel_admin_id,
        cancel_date: cancel_date,
        due_date: due_date,
        request_extend_date: request_extend_date,
        action_extend_admin_id: action_extend_admin_id,
        action_extend_date: action_extend_date,
        extend_due_date: extend_due_date,
        borrow_status: borrow_status,
        extend_status: extend_status,
        return_status: return_status}); 
    }

    //fungsi untuk delete Borrow
    static deleteBorrow(id){
      return this.destroy({ where: { id: id } })
    }

    //fungsi untuk update Borrow
    static updateBorrow({ id_borrow, user_id, user_name, item_id, item_title, code, request_date, booking_admin_id, booking_date, borrow_admin_id, borrow_date, return_admin_id, return_date, cancel_admin_id, cancel_date, due_date, request_extend_date, action_extend_admin_id, action_extend_date, extend_due_date, borrow_status, extend_status, return_status },id){
      return this.update({
        id_borrow: id_borrow, 
        user_id: user_id,
        user_name: user_name,
        item_id: item_id, 
        item_title: item_title,
        code: code, 
        request_date: request_date,
        booking_admin_id: booking_admin_id,
        booking_date: booking_date, 
        borrow_admin_id:  borrow_admin_id,
        borrow_date: borrow_date,
        return_admin_id: return_admin_id, 
        return_date: return_date,
        cancel_admin_id: cancel_admin_id,
        cancel_date: cancel_date,
        due_date: due_date,
        request_extend_date: request_extend_date,
        action_extend_admin_id: action_extend_admin_id,
        action_extend_date: action_extend_date,
        extend_due_date: extend_due_date,
        borrow_status: borrow_status,
        extend_status: extend_status,
        return_status: return_status }, { where:{id: id} })
    }

    //fungsi untuk mengambil data Borrow berdasarkan id
    static getBorrowById(id){
      return this.findOne({ where: { id: id } });
    }

  }
  Borrow.init({
    id_borrow: DataTypes.STRING,
    user_id:DataTypes.STRING,
    user_name:DataTypes.STRING,
    item_id:DataTypes.STRING,
    item_title:DataTypes.STRING,
    code: DataTypes.STRING,
    request_date: {
      type: DataTypes.DATEONLY,
      defaultValue: DataTypes.NOW
    },
    booking_admin_id: DataTypes.STRING,
    booking_date: DataTypes.DATEONLY,
    borrow_admin_id: DataTypes.STRING,
    borrow_date: DataTypes.DATEONLY,
    return_admin_id: DataTypes.STRING,
    return_date: DataTypes.DATEONLY,
    cancel_admin_id: DataTypes.STRING,
    cancel_date: DataTypes.DATEONLY,
    due_date: DataTypes.DATEONLY,
    request_extend_date: DataTypes.DATEONLY,
    action_extend_admin_id: DataTypes.STRING,
    action_extend_date: DataTypes.DATEONLY,
    extend_due_date: DataTypes.DATEONLY,
    borrow_status: DataTypes.STRING,
    extend_status: DataTypes.STRING,
    return_status: DataTypes.STRING,
  }, {
    sequelize,
    modelName: 'Borrow',
  });
  return Borrow;
};