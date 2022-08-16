const { Alert } = require('../../../models');

module.exports = {

  getAll: (req, res) => {
    Alert.findAll()
      .then((alerts) => res.json(alerts))
      .catch((err) => res.json(err));
  },

  add: (req, res) => {
    Alert.addAlert(req.body)
      .then((alert) =>
        res.json(alert))
      .catch((err) => res.json(err));
  },

  delete: (req, res) => {
    Alert.deleteAlert(req.params.id)
      .then(() => res.json({ msg: `Alert berhasil dihapus` }))
      .catch((err) => res.json(err));
  },

  update: (req, res) => {
    Alert.updateAlert(req.body, req.params.id)
      .then(() => res.json({ msg: "Update data Alert berhasil" }))
      .catch((err) => res.json(err));
  },


  getById: (req, res) => {
    Alert.getAlertById(req.params.id)
      .then((alert) => res.json(alert))
      .catch((err) => res.json(err));
  },


};