const passport = require('passport')
const LocalStrategy = require('passport-local').Strategy
const { Users } = require('../../models')
/* Fungsi untuk authentication */

async function authenticate(id_pegawai, password, done) {
    // console.log(id_pegawai)
    try {
        // console.log("masukuser")
        const user = await Users.authenticate({ id_pegawai, password })
        return done(null, user)
    }
    catch(err) {
        console.log(err)
        return done(null, false, { message: err })
    }

    
    
}

async function authenticateAdmin(id_pegawai, password, done) {
    try {
        // Memanggil method kita yang tadi
        const user = await Users.authenticateAdmin({ id_pegawai, password })
        /*
        done adalah callback, parameter pertamanya adalah error,
        jika tidak ada error, maka kita beri null saja.
        Parameter keduanya adalah data yang nantinya dapat
        kita akses di dalam req.user */
        // console.log("userAdmin")
        return done(null, user)
    }
    catch(err) {
        // console.log("errAdmin")
        // return done('Incorrect Username and Password')
    /* Parameter ketiga akan dilempar ke dalam flash */
        return done(null, false, { message: err })
        
        // return done(null, false, req.flash('LoginMsg', "User belum terdaftar"))
    }
}

passport.use('member-local', new LocalStrategy({ usernameField: 'id_pegawai', passwordField: 'password' }, authenticate))
passport.use('admin-local', new LocalStrategy({ usernameField: 'id_pegawai', passwordField: 'password' }, authenticateAdmin))
/* Serialize dan Deserialize
 Cara untuk membuat sesi dan menghapus sesi
*/

passport.serializeUser((user, done) => done(null, user.id))
// passport.deserializeUser(
//     async (id, done) => done(null, await Users.findByPk(id))
// )

passport.serializeUser((userAdmin, done) => done(null, userAdmin.id))
passport.deserializeUser(
    async (id, done) => done(null, await Users.findByPk(id))
)
// Kita exports karena akan kita gunakan sebagai middleware
module.exports = passport
