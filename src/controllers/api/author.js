const { Author, Alert } = require('../../../models');

module.exports = {

  getAll: (req, res) => {
    Author.findAll()
      .then((author) => res.json(author))
      .catch((err) => res.json(err));
  },

  add: (req, res) => {
    Author.addAuthor(req.body)
      .then((author) =>
        res.json(author))
      .catch((err) => res.json(err));
  },

  delete: (req, res) => {
    Author.deleteAuthor(req.params.id)
      .then(() => res.json({ msg: `Author berhasil dihapus` }))
      .catch((err) => res.json(err));
  },

  showAuthor: async (req, res) => {
    const alerts = await Alert.findAll(); 
    const author = await Author.findAll();
    res.render('pages/admin/author', {users:req.user, author: author, alerts: alerts});
  },


};