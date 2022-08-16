const { body, validationResult } = require('express-validator');


const users = () => {
  return [
    body('id_pegawai', 'id_pegawai tidak boleh kosong').isLength({ min: 1 }).trim(),
  ]
}

const item = () => {
  return [
    body('id_item', 'id_item tidak boleh kosong').isLength({ min: 1 }).trim(),
  ]
}

const borrow = () => {
  return [
    body('id_borrow', 'id_borrow tidak boleh kosong').isLength({ min: 1 }).trim(),
  ]
}

const alert = () => {
  return [
    body('senderId', 'senderId tidak boleh kosong').isLength({ min: 1 }).trim(),
  ]
}

const validate = (req, res, next) => {
  const errors = validationResult(req);
  if (errors.isEmpty()) {
    return next();
  }
  const extractedErrors = []
  errors.array().map(err => extractedErrors.push({ [err.param]: err.msg }))

  return res.status(400).json({ errors: extractedErrors })
}


module.exports = {
  users,
  item,
  borrow,
  alert,
  validate,
}