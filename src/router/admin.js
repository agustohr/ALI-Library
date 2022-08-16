// const router = require('express').Router();
const express = require('express');
const router = express.Router();
const { api } = require('../controllers');

// =========== item ============
router.get('/item_admin', api.item.showItemAdmin);
router.get('/all_transaction', api.borrow.showBorrow);
router.get('/users', api.users.showUsers);
router.get('/profile', api.users.profile);
router.get('/users_admin', api.users.showUsersAdmin);
router.get('/extend', api.borrow.extendBorrow);
router.get('/category', api.category.showCategory);
router.get('/author', api.author.showAuthor);
router.get('/publisher', api.publisher.showPublisher);
router.get('/shelf', api.shelf.showShelf);

//transaction
router.get('/request_booking', api.borrow.showReqBooking);
router.get('/borrow', api.borrow.showBooking);
router.get('/return', api.borrow.showBorrowed);
router.get('/completed', api.borrow.showCompleted);
router.get('/canceled', api.borrow.showCanceled);

router.use('/public/img', express.static('public/img'));
router.use('/pdfs', express.static('pdfs'));

router.get('/create_report', api.borrow.createPDF);

module.exports = router;