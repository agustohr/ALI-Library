'use strict';
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('Users', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER,
      },
      id_pegawai: {
        unique: true,
        type: Sequelize.STRING,
        allowNull: false,
      },
      nama: {
        type: Sequelize.STRING
      },
      password: {
        type: Sequelize.STRING
      },
      jabatan: {
        type: Sequelize.STRING
      },
      no_hp: {
        type: Sequelize.STRING
      },
      email: {
        unique: true,
        type: Sequelize.STRING
      },
      gender: {
        type: Sequelize.STRING
      },
      role: {
        type: Sequelize.STRING
      },
      ration: {
        type: Sequelize.INTEGER,
        defaultValue: 2
      },
      isVerified: {
        type: Sequelize.BOOLEAN,
        defaultValue: false,
      },
      status_users: {
        type: Sequelize.ENUM('active', 'notactive'),
        defaultValue: 'active',
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
    await queryInterface.dropTable('Users');
  }
};