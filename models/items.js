'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Items extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }

    //fungsi untuk menambahkan Item
    static addItem({ id_item, image, location, type, category, title, author, publisher, sinopsis, pages, language, quantity, available_quantity, items_status, entry_date}){
      return this.create({ 
        id_item: id_item, 
        image: image,
        location: location,
        type: type,
        category: category, 
        title: title, 
        author: author,
        publisher: publisher,
        sinopsis: sinopsis,
        pages: pages,
        language: language,
        quantity: quantity, 
        available_quantity: available_quantity,
        items_status: items_status,
        entry_date: entry_date }); 
    }

    //fungsi untuk delete Item
    static deleteItem(id){
      return this.destroy({ where: { id: id } })
    }

    //fungsi untuk update Item
    static updateItem({ id_item, image, location, type, category, title, author, publisher, sinopsis, pages, language, quantity, available_quantity, items_status, entry_date },id){
      return this.update({ 
        id_item: id_item, 
        image: image,
        location: location,
        type: type,
        category: category, 
        title: title, 
        author: author,
        publisher: publisher,
        sinopsis: sinopsis,
        pages: pages,
        language: language,
        quantity: quantity, 
        available_quantity: available_quantity,
        items_status: items_status,
        entry_date: entry_date }, { where:{id: id} })
    }

    //fungsi untuk mengambil data Item berdasarkan id
    static getItemById(id){
      return this.findOne({ where: { id: id } });
    }

    // static getItemByCatalog(catalog){
    //   return this.findAll({ 
    //     where: { 
    //       category: category,
    //       author: author,
    //       publisher: publisher 
    //     } });
    // }

    static getItemByCategory(category){
      return this.findAll({ where: { category: category } });
    }

    static getItemByAuthor(author){
      return this.findAll({ where: { author: author } });
    }

    static getItemByPublisher(publisher){
      return this.findAll({ where: { publisher: publisher } });
    }

    static getItemByTitle(title){
      return this.findAll({ where: { title: title } });
    }
    
  }
  Items.init({
    id_item: DataTypes.STRING,
    image: DataTypes.STRING,
    location: DataTypes.STRING,
    type: DataTypes.STRING,
    category: DataTypes.STRING,
    title: DataTypes.STRING,
    author: DataTypes.STRING,
    publisher: DataTypes.STRING,
    sinopsis: DataTypes.TEXT,
    pages: DataTypes.INTEGER,
    language: DataTypes.STRING,
    quantity: DataTypes.INTEGER,
    available_quantity: DataTypes.INTEGER,
    items_status: DataTypes.ENUM('available', 'notavailable'),
    entry_date: DataTypes.DATE
  }, {
    sequelize,
    modelName: 'Items',
  });
  return Items;
};