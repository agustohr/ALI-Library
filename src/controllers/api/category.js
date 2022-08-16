const { Category, Alert } = require('../../../models');

module.exports = {

  getAll: (req, res) => {
    Category.findAll()
      .then((categories) => res.json(categories))
      .catch((err) => res.json(err));
  },

  add: (req, res) => {
    Category.addCategory(req.body)
      .then((categories) =>
        res.json(categories))
      .catch((err) => res.json(err));
  },

  delete: (req, res) => {
    Category.deleteCategory(req.params.id)
      .then(() => res.json({ msg: `Category berhasil dihapus` }))
      .catch((err) => res.json(err));
  },

  showCategory: async (req, res) => {
    const alerts = await Alert.findAll(); 
    const category = await Category.findAll();
    res.render('pages/admin/category', {users:req.user, category: category, alerts: alerts});
  },


};