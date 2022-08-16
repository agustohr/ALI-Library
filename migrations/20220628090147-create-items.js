'use strict';
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('Items', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER,
      },
      id_item: {
        unique: true,
        allowNull: false,
        type: Sequelize.STRING,
      },
      image: {
        type: Sequelize.STRING
      },
      location: {
        type: Sequelize.STRING
      },
      type: {
        type: Sequelize.STRING //book, document, cd
      },
      category: {
        type: Sequelize.STRING
      },
      title: {
        type: Sequelize.STRING
      },
      author: {
        type: Sequelize.STRING
      },
      publisher: {
        type: Sequelize.STRING
      },
      sinopsis: {
        type: Sequelize.TEXT
      },
      pages: {
        type: Sequelize.INTEGER
      },
      language: {
        type: Sequelize.STRING
      },
      quantity: {
        type: Sequelize.INTEGER
      },
      available_quantity: {
        type: Sequelize.INTEGER
      },
      items_status: {
        type: Sequelize.ENUM('available', 'notavailable'),
        defaultValue: 'available',
      },
      entry_date: {
        type: Sequelize.DATE
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE
      }
    });
  },
  async down(queryInterface, Sequelize) {
    await queryInterface.dropTable('Items');
  }
};