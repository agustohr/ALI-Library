// const router = require('express').Router();
const express = require('express');
const router = express.Router();
const { api } = require('../controllers');
const { users, item, borrow, alert, validate } = require('../lib/validator.js');

// dependency multer
const multer = require("multer");
const storage = multer.diskStorage({
  // set direktori dimana gambar yg di upload akan disimpan
  destination: function (req, file, cb) {
    cb(null, 'public/img/');
  },
  // set nama file ketika gambar disimpan
  filename: function (req, file, cb) {
    cb(null, file.originalname);
  }
});
const upload = multer({ storage: storage });

//endpoint management Users
router.get('/get_all_users', api.users.getAll);
router.get('/get_users_by_id/:id', api.users.getById);
router.post('/add_users',users(), validate, api.users.add);
router.delete('/delete_users/:id', api.users.delete);
router.put('/update_users/:id',users(), validate, api.users.update);
router.put('/update_profile/:id', api.users.editProfile);

//endpoint management item
router.get('/get_all_item', api.item.getAll);
router.get('/get_item_by_id/:id', api.item.getById);
router.post('/add_item',item(), validate, api.item.add);
router.delete('/delete_item/:id', api.item.delete);
router.put('/update_item/:id', api.item.update);
router.post('/newItem', upload.single('image'), api.item.newItem);
router.put('/editImage/:id', upload.single('image'), api.item.editImage);

//endpoint management borrow
router.get('/get_all_borrow', api.borrow.getAll);
router.get('/get_borrow_by_id/:id', api.borrow.getById);
router.post('/add_borrow',borrow(), validate, api.borrow.add);
router.delete('/delete_borrow/:id', api.borrow.delete);
router.put('/update_borrow/:id', api.borrow.update);

//endpoint image
router.use('/public/img', express.static('public/img'));

//endpoint alert
router.get('/get_all_alert', api.alert.getAll);
router.post('/add_alert',alert(), validate, api.alert.add);

//endpoint category
router.get('/get_all_category', api.category.getAll);
router.post('/add_category', api.category.add);

//endpoint author
router.get('/get_all_author', api.author.getAll);
router.post('/add_author', api.author.add);

//endpoint publisher
router.get('/get_all_publisher', api.publisher.getAll);
router.post('/add_publisher', api.publisher.add);

//endpoint publisher
router.get('/get_all_shelf', api.shelf.getAll);
router.post('/add_shelf', api.shelf.add);

module.exports = router;