const router = require('express').Router();

const controller = require('../controllers');

const api = require('./api')
const admin = require('./admin')
const home = require('./home')

// Controllers
const auth = require('./../controllers/api/authController' )
const verify = require('../controllers/api/verify')
const verifyAdmin = require('../controllers/api/verifyAdmin')

// =================Register Page
router.get('/register' , (req, res) => res.render('register'))
router.get('/verifikasi' , (req, res) => res.render('verifikasi'))
router.post('/register' , auth.register )

//====================login
// router.get('/login', (req, res) => res.render('login'))
router.post('/login', auth.login)

/* Handle Logout */
router.get('/logout', auth.logout);

router.get('/', controller.index);
// router.get('/about', function(req, res) {
//     res.render('pages/about');
// });

//======================loginAdmin
router.get('/loginAdmin', function(req, res) {
    res.render('pages/admin//login');
});
router.post('/loginAdmin', auth.loginAdmin);

router.get('/admin', verifyAdmin, controller.admin);
router.get('/home', verify, controller.home);


router.use('/api', api);
router.use('/admin', verifyAdmin, admin);
router.use('/home', verify, home);



module.exports = router;
