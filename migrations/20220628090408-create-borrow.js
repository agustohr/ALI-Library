'use strict';
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('Borrows', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER,
      },
      id_borrow: {
        unique: true,
        allowNull: false,
        type: Sequelize.STRING,
      },
      user_id: {
        type: Sequelize.STRING,
        allowNull: false,
        references: {
          model: 'Users',
          key: 'id_pegawai',
        },
      },
      user_name: {
        type: Sequelize.STRING,
        allowNull: false,
      },
      item_id: {
        type: Sequelize.STRING,
        allowNull: false,
        references: {
          model: 'Items',
          key: 'id_item',
        },
      },
      item_title: {
        type: Sequelize.STRING,
        allowNull: false,
      },
      code: {
        type: Sequelize.STRING
      },
      request_date: {
        type: Sequelize.DATEONLY
      },
      booking_admin_id: {
        type: Sequelize.STRING,
        references: {
          model: 'Users',
          key: 'id_pegawai',
        },
      },
      booking_date: {
        type: Sequelize.DATEONLY
      },
      borrow_admin_id: {
        type: Sequelize.STRING,
        references: {
          model: 'Users',
          key: 'id_pegawai',
        },
      },
      borrow_date: {
        type: Sequelize.DATEONLY
      },
      return_admin_id: {
        type: Sequelize.STRING,
        references: {
          model: 'Users',
          key: 'id_pegawai',
        },
      },
      return_date: {
        type: Sequelize.DATEONLY
      },
      cancel_admin_id: {
        type: Sequelize.STRING,
        references: {
          model: 'Users',
          key: 'id_pegawai',
        },
      },
      cancel_date: {
        type: Sequelize.DATEONLY
      },
      due_date: {
        type: Sequelize.DATEONLY
      },
      borrow_status: {
        type: Sequelize.STRING, //request, booking, borrowed, completed, canceled
        defaultValue: 'request',
      },
      request_extend_date: {
        type: Sequelize.DATEONLY
      },
      action_extend_admin_id: {
        type: Sequelize.STRING,
        references: {
          model: 'Users',
          key: 'id_pegawai',
        },
      },
      action_extend_date: {
        type: Sequelize.DATEONLY
      },
      extend_due_date: {
        type: Sequelize.DATEONLY
      },
      extend_status:{
        type: Sequelize.STRING, //request extend, extend approved, extend notapproved
      },
      return_status: {
        type: Sequelize.STRING
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
    await queryInterface.dropTable('Borrows');
  }
};