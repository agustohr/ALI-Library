module.exports = (req, res, next) => {

  if (req.isAuthenticated()) {
    if (req.user.role == "member") {
      return next();
    }else{
      return res.redirect('/admin');
    }
  }
  res.redirect('/');
}