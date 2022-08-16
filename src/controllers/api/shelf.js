const { Shelf, Alert } = require('../../../models');

module.exports = {

  getAll: (req, res) => {
    Shelf.findAll()
      .then((shelf) => res.json(shelf))
      .catch((err) => res.json(err));
  },

  add: (req, res) => {
    Shelf.addShelf(req.body)
      .then((shelf) =>
        res.json(shelf))
      .catch((err) => res.json(err));
  },

  delete: (req, res) => {
    Shelf.deleteShelf(req.params.id)
      .then(() => res.json({ msg: `Shelf berhasil dihapus` }))
      .catch((err) => res.json(err));
  },

  showShelf: async (req, res) => {
    const alerts = await Alert.findAll(); 
    const shelf = await Shelf.findAll();
    res.render('pages/admin/shelf', {users:req.user, shelf: shelf, alerts: alerts});
  },


};