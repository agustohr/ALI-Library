// controllers/authController.js
const { Users } = require('../../../models' )
const passport = require('../../lib/passport')
// const passportAdmin = require('../../lib/passportAdmin')
module.exports = {
    register : (req, res, next) => {
        // Kita panggil static method register yang sudah kita buat tadi
        Users.register (req.body)
            .then(() => {
                res.redirect ('/verifikasi' )
            })
            .catch(err => next(err));
    },

    login : passport.authenticate('member-local', {
        successRedirect: '/home',
        failureRedirect: '/',
        failureFlash: true // Untuk mengaktifkan express flash
    }),
   
    logout : function(req, res, next) {
        req.logout(function(err){
            if (err) { return next(err)}
            res.redirect('/');
        });
    },

    loginAdmin : passport.authenticate('admin-local', {
        successRedirect: '/admin',
        failureRedirect: '/loginAdmin',
        failureFlash: true // Untuk mengaktifkan express flash
    }),

}
