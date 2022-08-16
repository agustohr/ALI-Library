'use strict';
const {
  Model
} = require('sequelize');

//Pertama, kita import bcrypt untuk melakukan enkripsi
const bcrypt = require('bcrypt')

module.exports = (sequelize, DataTypes) => {
  class Users extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
    
    // Method untuk melakukan enkripsi
    // static #encrypt = (password) => bcrypt.hashSync (password, 10)
    

    static #encrypt = function (password) {
      console.log("3-"+password)
      const salt = bcrypt.genSaltSync(10);
      const hash = bcrypt.hashSync(password, salt);
      console.log("4-"+hash)
      return hash
    };


    //fungsi untuk menambahkan users
    static addUsers({id_pegawai, nama, password, jabatan, no_hp, email, gender, role, status_users}){
      const encryptedPassword = this.#encrypt(password)
      // console.log("encryptedPassword")
      return this.create({ 
        id_pegawai: id_pegawai, 
        nama: nama, 
        password: encryptedPassword, 
        jabatan: jabatan, 
        no_hp: no_hp, 
        email: email,
        gender: gender, 
        role: role,
        status_users: status_users }); 
    }

    //fungsi untuk delete users
    static deleteUsers(id){
      return this.destroy({ where: { id: id } })
    }

    //fungsi untuk update users
    static updateUsers({ id_pegawai, nama, password, jabatan, no_hp, email, gender, role, status_users },id){
      // console.log("1-"+password)
      // console.log("2-encryptedPassword")
      const encryptedPassword = this.#encrypt(password)
      // console.log("5-" + encryptedPassword)
      return this.update({ 
        id_pegawai: id_pegawai, 
        nama: nama, 
        password: encryptedPassword, 
        jabatan: jabatan, 
        no_hp: no_hp, 
        email: email, 
        gender: gender,
        role: role,
        status_users: status_users }, { where:{id: id} })
    }

    //fungsi untuk mengambil data users berdasarkan id
    static getUsersById(id){
      return this.findOne({ where: { id: id } });
    }

    //fungsi untuk edit Profile
    static updateProfile({ id_pegawai, nama, jabatan, no_hp, email, gender, role, ration, isVerified, status_users },id){
      return this.update({ 
        id_pegawai: id_pegawai, 
        nama: nama, 
        jabatan: jabatan, 
        no_hp: no_hp, 
        email: email,
        gender: gender,
        role: role,
        ration: ration,
        isVerified: isVerified,
        status_users: status_users }, { where:{id: id} })
    }

    //=============================Register=====================================
    // Method untuk melakukan enkripsi
    // static #encrypt = (password) => bcrypt.hashSync (password, 10)

    // Lalu, kita buat method register
    static register = ({ id_pegawai, nama, password, jabatan, no_hp, email, gender }) => {
      const encryptedPassword = this.#encrypt(password)
      /*
      #encrypt dari static method
      encryptedPassword akan sama dengan string 
      hasil enkripsi password dari method #encrypt
      */
      return this.create({ 
        id_pegawai: id_pegawai, 
        nama: nama, 
        password: encryptedPassword, 
        jabatan: jabatan, 
        no_hp: no_hp, 
        email: email, 
        gender: gender,
        // isVerified: isVerified,
        role: 'member' })
    }
    
    //=============================Login=====================================
    /* Method .compareSync digunakan untuk mencocokkan plaintext dengan hash. */
    checkPassword = password => bcrypt.compareSync(password, this.password)
    // checkPassword = (password, hashPaswordFromDatabase) => bcrypt.compareSync(password, hashPaswordFromDatabase);


    /* Method Authenticate, untuk login */
    static authenticate = async ({ id_pegawai, password }) => {
      try {
        const user = await this.findOne({ where: {  id_pegawai }})
        // console.log(user.role)
        if (!user) {
          console.log('User Not Found with username');
          return Promise.reject("User not found!")
        }
        const isPasswordValid = user.checkPassword(password)
        if (!isPasswordValid) {
          console.log('Password salah');
          return Promise.reject("Wrong password")
        }
        // const isRoleMember = await this.findOne({ where: {  role }})
        // console.log(user.checkPassword(password))
        if (user.role != 'member') {
          // console.log('Role bukan member');
          return Promise.reject("This acount is not member")
        }
        // if (user.role != 'admin') {
        //   return Promise.reject("This acount is not admin")
        // }
        return Promise.resolve(user)
      }
      catch(err) {
        return Promise.reject(err)
      }
    }

    static authenticateAdmin = async ({ id_pegawai, password }) => {
      try {
        const user = await this.findOne({ where: {  id_pegawai }})
        // console.log(user.role)
        if (!user) {
          console.log('User Not Found with username');
          return Promise.reject("User not found!")
        }
        const isPasswordValid = user.checkPassword(password)
        if (!isPasswordValid) {
          console.log('Password salah');
          return Promise.reject("Wrong password")
        }
        // const isRoleMember = await this.findOne({ where: {  role }})
        // console.log(user.checkPassword(password))
        if (user.role != 'admin') {
          // console.log('Role bukan admin');
          return Promise.reject("This acount is not admin")
        }
        return Promise.resolve(user)
      }
      catch(err) {
        return Promise.reject(err)
      }
    }


  }
  Users.init({
    id_pegawai: DataTypes.STRING,
    nama: DataTypes.STRING,
    password: DataTypes.STRING,
    jabatan: DataTypes.STRING,
    no_hp: DataTypes.STRING,
    email: DataTypes.STRING,
    gender: DataTypes.STRING,
    role: DataTypes.STRING,
    ration: DataTypes.INTEGER,
    isVerified: DataTypes.INTEGER,
    status_users: DataTypes.ENUM('active', 'notactive'),
  }, {
    sequelize,
    modelName: 'Users',
  });
  return Users;
};