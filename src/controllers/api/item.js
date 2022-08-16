const { Borrow, Items, Alert, Category, Author, Publisher, Shelf } = require('../../../models');
const { Op } = require("sequelize");

module.exports = {
  getAll: (req, res) => {
    Items.findAll()
      .then((items) => res.json(items))
      .catch((err) => res.json(err));
  },

  add: (req, res) => {
    Items.addItem(req.body)
      .then((item) =>
        res.json(item))
      .catch((err) => res.json(err));
  },

  delete: (req, res) => {
    Items.deleteItem(req.params.id)
      .then(() => res.json({ msg: `Items berhasil dihapus` }))
      .catch((err) => res.json(err));
  },

  update: (req, res) => {
    Items.updateItem(req.body, req.params.id)
      .then(() => res.json({ msg: "Update data Items berhasil" }))
      .catch((err) => res.json(err));
  },

  getById: (req, res) => {
    Items.getItemById(req.params.id)
      .then((item) => res.json(item))
      .catch((err) => res.json(err));
  },

  // =========================== member =========================
  //filter by category
  getByCategoryCollections: async (req, res) => {
    const pageAsNumber = Number.parseInt(req.query.page);
    const sizeAsNumber = Number.parseInt(req.query.size);

    let page = 0;
    if (!Number.isNaN(pageAsNumber) && pageAsNumber > 0) {
      page = pageAsNumber;
    }

    let size = 3;
    if (!Number.isNaN(sizeAsNumber) && sizeAsNumber > 0 && sizeAsNumber < 3) {
      size = sizeAsNumber;
    }

    const borrows = await Borrow.findAll(); 
    const alerts = await Alert.findAll();

    const items = await Items.findAndCountAll({
      where: { category: req.params.category },
      order: [
        ['createdAt', 'DESC'],
      ],
      limit: size,
      offset: page*size
    })
    res.render('pages/member/collections', {items: items.rows, users:req.user, borrows: borrows, alerts: alerts, totalPages: Math.ceil(items.count / size), page: page});

  },

  //filter by author
  getByAuthorCollections: async (req, res) => {
    const pageAsNumber = Number.parseInt(req.query.page);
    const sizeAsNumber = Number.parseInt(req.query.size);

    let page = 0;
    if (!Number.isNaN(pageAsNumber) && pageAsNumber > 0) {
      page = pageAsNumber;
    }

    let size = 3;
    if (!Number.isNaN(sizeAsNumber) && sizeAsNumber > 0 && sizeAsNumber < 3) {
      size = sizeAsNumber;
    }

    const borrows = await Borrow.findAll(); 
    const alerts = await Alert.findAll();

    const items = await Items.findAndCountAll({
      where: { author: req.params.author },
      order: [
        ['createdAt', 'DESC'],
      ],
      limit: size,
      offset: page*size
    })
    res.render('pages/member/collections', {items: items.rows, users:req.user, borrows: borrows, alerts: alerts, totalPages: Math.ceil(items.count / size), page: page});
  },

  //filter by publisher
  getByPublisherCollections: async (req, res) => {
    const pageAsNumber = Number.parseInt(req.query.page);
    const sizeAsNumber = Number.parseInt(req.query.size);

    let page = 0;
    if (!Number.isNaN(pageAsNumber) && pageAsNumber > 0) {
      page = pageAsNumber;
    }

    let size = 3;
    if (!Number.isNaN(sizeAsNumber) && sizeAsNumber > 0 && sizeAsNumber < 3) {
      size = sizeAsNumber;
    }

    const borrows = await Borrow.findAll(); 
    const alerts = await Alert.findAll();

    const items = await Items.findAndCountAll({
      where: { publisher: req.params.publisher },
      order: [
        ['createdAt', 'DESC'],
      ],
      limit: size,
      offset: page*size
    })
    res.render('pages/member/collections', {items: items.rows, users:req.user, borrows: borrows, alerts: alerts, totalPages: Math.ceil(items.count / size), page: page});
  },

  //search by title
  getByTitleCollections: async (req, res) => {
    const pageAsNumber = Number.parseInt(req.query.page);
    const sizeAsNumber = Number.parseInt(req.query.size);

    let page = 0;
    if (!Number.isNaN(pageAsNumber) && pageAsNumber > 0) {
      page = pageAsNumber;
    }

    let size = 3;
    if (!Number.isNaN(sizeAsNumber) && sizeAsNumber > 0 && sizeAsNumber < 3) {
      size = sizeAsNumber;
    }

    const borrows = await Borrow.findAll(); 
    const alerts = await Alert.findAll();

    const items = await Items.findAndCountAll({
      where: { 
        title: {
          [Op.iLike]: `%${req.params.title}%`
        }
      },
      order: [
        ['createdAt', 'DESC'],
      ],
      limit: size,
      offset: page*size
    })
    res.render('pages/member/collections', {items: items.rows, users:req.user, borrows: borrows, alerts: alerts, totalPages: Math.ceil(items.count / size), page: page});
  },

  //detail choose item
  getCollectionsDetail: async (req, res) => {
    const borrows = await Borrow.findAll(); 
    const alerts = await Alert.findAll();
    Items.getItemById(req.params.id)
      .then((items) => {
        
        res.render('pages/member/collections-detail', {items: items, users:req.user, borrows: borrows, alerts: alerts});
      })
      .catch((err) => res.json(err));
  },

  //show collections item
  collections: async (req, res) => {
    const pageAsNumber = Number.parseInt(req.query.page);
    const sizeAsNumber = Number.parseInt(req.query.size);

    let page = 0;
    if (!Number.isNaN(pageAsNumber) && pageAsNumber > 0) {
      page = pageAsNumber;
    }

    let size = 3;
    if (!Number.isNaN(sizeAsNumber) && sizeAsNumber > 0 && sizeAsNumber < 3) {
      size = sizeAsNumber;
    }

    // const { page, size } = req.query;
    const borrows = await Borrow.findAll(); 
    const alerts = await Alert.findAll();
    // console.log(req.params.p);
    

    const items = await Items.findAndCountAll({
      order: [
        ['createdAt', 'DESC'],
      ],
      limit: size,
      offset: page*size
    })
    res.render('pages/member/collections', {items: items.rows, users:req.user, borrows: borrows, alerts: alerts, totalPages: Math.ceil(items.count / size), page: page});
  },

  // ====================== end member ======================

  // ====================== admin ======================
  //list item
  showItemAdmin: async (req, res) => {
    const alerts = await Alert.findAll();
    const items = await Items.findAll(); 
    const borrows = await Borrow.findAll();
    const category = await Category.findAll();
    const author = await Author.findAll();
    const publisher = await Publisher.findAll();
    const shelf = await Shelf.findAll();
    res.render('pages/admin/item', {items: items, users:req.user, borrows: borrows, category: category, author: author, publisher: publisher, shelf: shelf, alerts: alerts});
  },

  //add new item
  newItem : (req, res, next) => {
    Items.addItem({
      id_item: req.body.id_item,
      image: req.file.path,
      location: req.body.location,
      type: req.body.type,
      category: req.body.category,
      title: req.body.title,
      author: req.body.author,
      publisher: req.body.publisher,
      sinopsis: req.body.sinopsis,
      pages: req.body.pages,
      language: req.body.language,
      quantity: req.body.quantity,
      available_quantity: req.body.quantity,
      entry_date: req.body.entry_date,
      items_status: req.body.items_status,
    }).then(() => {
        res.redirect ('/admin/item_admin' )
    })
    .catch(err => next(err));
  },

  //edit image
  editImage : (req, res, next) => {
    Items.updateItem({ id_item: req.body.id_item, image: req.file.path}, req.params.id)
    .then(() => res.json({ msg: "Update data Items berhasil" }))
    .catch((err) => res.json(err));
  },

  // ====================== end admin ======================

};