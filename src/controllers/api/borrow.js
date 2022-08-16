const { Borrow, Users, Items, Alert } = require('../../../models');
let path = require('path');
let pdf = require("pdf-creator-node");
let fs = require('fs');

module.exports = {
  getAll: (req, res) => {
    Borrow.findAll()
      .then((borrows) => res.json(borrows))
      .catch((err) => res.json(err));
  },

  add: (req, res) => {
    Borrow.addBorrow(req.body)
      .then((borrow) =>
        res.json(borrow))
      .catch((err) => res.json(err));
  },

  delete: (req, res) => {
    Borrow.deleteBorrow(req.params.id)
      .then(() => res.json({ msg: `Borrow berhasil dihapus` }))
      .catch((err) => res.json(err));
  },

  // update: (req, res) => {
  //   Borrow.updateBorrow(req.body, req.params.id)
  //     .then(() => res.json({ msg: "Update data Borrow berhasil" }))
  //     .catch((err) => res.json(err));
  // },

  update: (req, res) => {
    Borrow.updateBorrow(req.body, req.params.id)
      .then(() => {
        let dataBorrow = Borrow.findAll()
        .then((borrows) => res.json(borrows))
        console.log(dataBorrow)
        return dataBorrow
      })
      .catch((err) => res.json(err));
  },

  getById: (req, res) => {
    Borrow.getBorrowById(req.params.id)
      .then((borrow) => res.json(borrow))
      .catch((err) => res.json(err));
  },

  // ============================= admin =================================

  showBorrow: async (req, res) => {
    const borrows = await Borrow.findAll(); 
    const user = await Users.findAll(); 
    const item = await Items.findAll(); 
    const alerts = await Alert.findAll();
    res.render('pages/admin/allTransaction', {borrows: borrows, users: req.user, user: user, item: item, alerts: alerts});
  },

  showReqBooking: async (req, res) => {
    const borrows = await Borrow.findAll(); 
    const user = await Users.findAll(); 
    const item = await Items.findAll(); 
    const alerts = await Alert.findAll();
    res.render('pages/admin/reqBooking', {borrows: borrows, users: req.user, user: user, item: item, alerts: alerts});
  },

  showBooking: async (req, res) => {
    const borrows = await Borrow.findAll(); 
    const user = await Users.findAll(); 
    const item = await Items.findAll(); 
    const alerts = await Alert.findAll();
    res.render('pages/admin/borrow', {borrows: borrows, users: req.user, user: user, item: item, alerts: alerts});
  },

  showBorrowed: async (req, res) => {
    const borrows = await Borrow.findAll(); 
    const user = await Users.findAll(); 
    const item = await Items.findAll(); 
    const alerts = await Alert.findAll();
    res.render('pages/admin/return', {borrows: borrows, users: req.user, user: user, item: item, alerts: alerts});
  },

  showCompleted: async (req, res) => {
    const borrows = await Borrow.findAll(); 
    const user = await Users.findAll(); 
    const item = await Items.findAll(); 
    const alerts = await Alert.findAll();
    res.render('pages/admin/completed', {borrows: borrows, users: req.user, user: user, item: item, alerts: alerts});
  },

  showCanceled: async (req, res) => {
    const borrows = await Borrow.findAll(); 
    const user = await Users.findAll(); 
    const item = await Items.findAll(); 
    const alerts = await Alert.findAll();
    res.render('pages/admin/canceled', {borrows: borrows, users: req.user, user: user, item: item, alerts: alerts});
  },

  extendBorrow: async (req, res) => {
    const borrows = await Borrow.findAll(); 
    const user = await Users.findAll(); 
    const item = await Items.findAll(); 
    const alerts = await Alert.findAll();
    res.render('pages/admin/extend', {borrows: borrows, users: req.user, user: user, item: item, alerts: alerts});
  },

  createPDF: async (req, res) => {
    var template_pdf = fs.readFileSync("./public/template/report_transaction.html", "utf8");
    const options = {
        format: "A4",
        orientation: "landscape",
        border: "10mm"
    }

    const alerts = await Alert.findAll();
    const filename = 'report_transaction.pdf';

    Borrow.findAll()
        .then((borrows) => {
          borrows.sort(function(a,b){
            // Turn your strings into dates, and then subtract them
            // to get a value that is either negative, positive, or zero.
            return new Date(b.createdAt) - new Date(a.createdAt);
          });

          // var loan = borrows.filter(function(borrow) {
          //   // console.log(new Date(borrow.createdAt).getMonth()+1);
          //   return new Date(borrow.createdAt).getMonth()+1  == 9;
          // })
          // console.log(loan);
          
          // borrows.map(async (borrow)=>{
            
          //   if (new Date(borrow.createdAt).getMonth()+1  == 8) {
              
          //   }
            
          // })
          const document = {
            html: template_pdf,
            data: {
                borrows: borrows.map(borrow => borrow.toJSON()),
                total: borrows.length,
                dateNow: new Date()
            },
            path: "./pdfs/"+filename
        }
        pdf
            .create(document,options)
            .then((res) => {
                console.log(res);
            })
            .catch((err) => {
                console.log(err);
            })
            const filepath = 'http://localhost:8001/admin/pdfs/'+filename;
            res.render('pages/admin/downloadReport', {alerts: alerts, users: req.user, path: filepath})
        })
        .catch((err) => res.json(err));
    // res.render('template/template.html', {borrows: borrows.map(borrow => borrow.toJSON())})
  },

  // ============================= end admin =================================

  // ============================= member =================================

  history_extend: async (req, res) => {
    const borrows = await Borrow.findAll(); 
    const items = await Items.findAll();
    const alerts = await Alert.findAll();
    res.render('pages/member/history-extend', {borrows: borrows, users: req.user, items: items, alerts: alerts});
  },

  // ============================= end member =================================
  
};