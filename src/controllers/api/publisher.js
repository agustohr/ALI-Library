const { Publisher, Alert } = require('../../../models');

module.exports = {

  getAll: (req, res) => {
    Publisher.findAll()
      .then((publisher) => res.json(publisher))
      .catch((err) => res.json(err));
  },

  add: (req, res) => {
    Publisher.addPublisher(req.body)
      .then((publisher) =>
        res.json(publisher))
      .catch((err) => res.json(err));
  },

  delete: (req, res) => {
    Publisher.deletePublisher(req.params.id)
      .then(() => res.json({ msg: `Publisher berhasil dihapus` }))
      .catch((err) => res.json(err));
  },

  showPublisher: async (req, res) => {
    const alerts = await Alert.findAll(); 
    const publisher = await Publisher.findAll();
    res.render('pages/admin/publisher', {users:req.user, publisher: publisher, alerts: alerts});
  },


};