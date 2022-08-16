// const router = require('express').Router();
const express = require('express');
const router = express.Router();
const { api } = require('../controllers');

router.get('/collections', api.item.collections);
router.get('/collections/categories/:category', api.item.getByCategoryCollections);
router.get('/collections/author/:author', api.item.getByAuthorCollections);
router.get('/collections/publisher/:publisher', api.item.getByPublisherCollections);
router.get('/collections/title/:title', api.item.getByTitleCollections);
router.get('/collections/detail/:id', api.item.getCollectionsDetail);
router.get('/history_extend', api.borrow.history_extend);

router.use('/public/img', express.static('public/img'));
router.use('/collections/public/img', express.static('public/img'));
router.use('/collections/detail/public/img', express.static('public/img'));
router.use('/collections/categories/public/img', express.static('public/img'));
router.use('/collections/author/public/img', express.static('public/img'));
router.use('/collections/publisher/public/img', express.static('public/img'));
router.use('/collections/title/public/img', express.static('public/img'));



module.exports = router;