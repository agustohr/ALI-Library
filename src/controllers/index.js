const { Users } = require('../../models');
const { Items } = require('../../models');
const { Borrow } = require('../../models');
const { Alert } = require('../../models');

module.exports = {
  index: async (req, res) => {
    res.render('pages/index');
  },

  admin: async (req, res) => {
    const pegawai = await Users.findAll();
    const item = await Items.findAll();
    const borrow = await Borrow.findAll();
    const alerts = await Alert.findAll();
    res.render('pages/admin/admin', {users: req.user, pegawai: pegawai, item: item, borrow: borrow, alerts: alerts});
  },

  home: async (req, res) => {
    const alerts = await Alert.findAll();
    const item = await Items.findAll();
    // const users = req.user
    // console.log(req.user)
    res.render('pages/member/home', {users: req.user, alerts: alerts, item: item});
  },

  verifikasi: async (req, res) => {
    const user = await Users.findAll();
    res.render('verifikasi', {user: user});
  },
  
  api: require('./api'),
}