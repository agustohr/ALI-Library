const { Users, Alert } = require('../../../models');

module.exports = {
  getAll: (req, res) => {
    Users.findAll()
      .then((users) => res.json(users))
      .catch((err) => res.json(err));
  },

  add: (req, res) => {
    Users.addUsers(req.body)
      .then((users) =>
        res.json(users))
      .catch((err) => res.json(err));
  },

  delete: (req, res) => {
    Users.deleteUsers(req.params.id)
      .then(() => res.json({ msg: `Users berhasil dihapus` }))
      .catch((err) => res.json(err));
  },

  update: (req, res) => {
    Users.updateUsers(req.body, req.params.id)
      .then(() => res.json({ msg: "Update data Users berhasil" }))
      .catch((err) => res.json(err));
  },

  editProfile: (req, res) => {
    Users.updateProfile(req.body, req.params.id)
      .then(() => res.json({ msg: "Update data Users berhasil" }))
      .catch((err) => res.json(err));
  },

  getById: (req, res) => {
    Users.getUsersById(req.params.id)
      .then((users) => res.json(users))
      .catch((err) => res.json(err));
  },

  showUsers: async (req, res) => {
    const alerts = await Alert.findAll();
    const user = await Users.findAll(); 
    res.render('pages/admin/users', {users: req.user, user: user, alerts: alerts});
  },

  showUsersAdmin: async (req, res) => {
    const alerts = await Alert.findAll();
    const user = await Users.findAll(); 
    res.render('pages/admin/users_admin', {users: req.user, user: user, alerts: alerts});
  },

  profile: async (req, res) => {
    const alerts = await Alert.findAll();
    const user = await Users.findAll(); 
    res.render('pages/admin/profile', {users: req.user, user: user, alerts: alerts});
  },


};