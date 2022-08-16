let express = require('express')
let bodyParser = require('body-parser')
//let libraryRoutes = require('./routes/LibraryRoute');
if (process.env.NODE_ENV !== 'production') { 
    require('dotenv').config();
}
// let db = require('./models');
let app = express();
const { Borrow, Users, Items } = require('./models');
const session = require('express-session')
const flash = require('express-flash')
let fs = require('fs');
let handlebars = require('handlebars');
let path = require('path');


const cron = require('node-cron');


const nodemailer = require('nodemailer');
const transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
        user: process.env.EMAIL,
        pass: process.env.PASSWORD_EMAIL
    }
});

app.use(express.json());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended:false}));

// app.use(express.urlencoded({extended:false}));

//app.use(libraryRoutes);

// Kedua, setting session handler
app.use(session({
    secret: 'Buat ini jadi rahasia',
    resave: false,
    saveUninitialized: false
}))

// Ketiga, setting passport 
// (sebelum router dan view engine)
const passport = require('./src/lib/passport')
app.use(passport.initialize())
app.use(passport.session())

// Keempat, setting flash
app.use(flash())


// Kita pakai untuk memasang view engine EJS
app.set('view engine', 'ejs')
app.use(express.static(__dirname + '/public'));
// app.use(express.static(__dirname + '/pdfs'));
// app.use('/pdfs',express.static(path.join(__dirname + 'pdfs')));



const router = require('./src/router');
// const users = require('./src/controllers/api/users');
app.use(router);


// let server;
const PORT = process.env.PORT || 8001;
// db.sequelize.sync().then( () => {
//     app.listen(PORT, () => {
//         console.log(`listening on: http://localhost:${PORT}`);
//     });

    
// });

const server = app.listen(PORT, () => {
    console.log(`listening on: http://localhost:${PORT}`);
});

const socket = require("socket.io");
const { stringify } = require('querystring');
const { template } = require('handlebars');
const { DATEONLY } = require('sequelize');
//socket setup
const io = socket(server);

let onlineUsers = [];

const addNewUser = (username, socketId) => {
    console.log('usernameAtas : '+username);
    console.log('sockedId : '+socketId);
    !onlineUsers.some((user) => user.username === username) && onlineUsers.push({username, socketId});
    console.log('onlineUsers : '+JSON.stringify(onlineUsers));
};

const removeUser = (socketId) => {
    onlineUsers = onlineUsers.filter((user) => user.socketId !== socketId);
};

const getUser = (username) => {
    console.log('check1 === '+username)
    console.log('check2 === '+onlineUsers.find((user) =>  user.username === username));
    return onlineUsers.find((user) => user.username === username);
};


cron.schedule(`0 7 * * *`, () => {
    
    Borrow.findAll({
        where: {
            borrow_status: "borrowed"
        }
    }).then((borrows)=>{
        borrows.map(async (borrow)=>{
            const user = await Users.findOne({
                where: {
                    id_pegawai: borrow.user_id
                }
            });
            const item = await Items.findOne({
                where: {
                    id_item: borrow.item_id
                }
            });
            let dateNow = `${new Date().getDate()}/${new Date().getMonth()+1}/${new Date().getFullYear()}`;
            let tglskrg = new Date();
            // tglskrg.setHours(0);
            // tglskrg.setMinutes(0);
            // tglskrg.setSeconds(0);
            console.log(tglskrg);
            // console.log(item);
            // console.log(borrow);
            let due;
            let tgl;
            let bln;
            let thn;
            // let mnt = `${new Date().getMinutes()}`;
            // let sec = `${new Date().getSeconds()}`;
            
            if (borrow.extend_due_date != null) {
                due = new Date(borrow.extend_due_date);
                tgl = new Date(borrow.extend_due_date).getDate();
                bln = new Date(borrow.extend_due_date).getMonth()+1;
                thn = new Date(borrow.extend_due_date).getFullYear();
            }else{
                due = new Date(borrow.due_date);
                tgl = new Date(borrow.due_date).getDate();
                bln = new Date(borrow.due_date).getMonth()+1;
                thn = new Date(borrow.due_date).getFullYear();
            }
            let dueDate = `${tgl}/${bln}/${thn}`
            console.log(due);
            console.log('tgl '+tgl+' email: '+user.email);
            
            if (tglskrg > due) {
                // borrow.overdue = "overdue";
                Borrow.update({ return_status: "overdue" }, {
                    where: {
                        id: borrow.id
                    }
                });
                console.log("masuk")
                
                const filePath = path.join(__dirname, 'public/template/reminderOverdue.html');
                const source = fs.readFileSync(filePath, 'utf-8').toString();
                var template = handlebars.compile(source);
                var replacements = {
                        // senderId: senderId,
                        name: user.nama,
                        id_item: item.id_item,
                        title: item.title,
                        dueDate: dueDate,
                        // subtext: subtext,
                };
                var htmlToSend = template(replacements);
                const mailOptions = {
                    from: 'agusdurant7@gmail.com',
                    to: user.email, //receiver email
                    subject: 'ALI Library - Reminder',
                    html: htmlToSend
                };
                transporter.sendMail(mailOptions, function(error, info){
                    if(error){
                        console.log(error);
                    }else{
                        console.log('email berhasil dikirim : '+info.response);
                    }
                });
            }
            var task = cron.schedule(`0 8 ${tgl-1} ${bln} *`, () => {
                const filePath = path.join(__dirname, 'public/template/reminderReturn.html');
                const source = fs.readFileSync(filePath, 'utf-8').toString();
                var template = handlebars.compile(source);
                var replacements = {
                        // senderId: senderId,
                        name: user.nama,
                        id_item: item.id_item,
                        title: item.title,
                        dueDate: dueDate,
                        // subtext: subtext,
                };
                var htmlToSend = template(replacements);
                const mailOptions = {
                    from: 'agusdurant7@gmail.com',
                    to: user.email, //receiver email
                    subject: 'ALI Library - Reminder',
                    html: htmlToSend
                };
                transporter.sendMail(mailOptions, function(error, info){
                    if(error){
                        console.log(error);
                    }else{
                        console.log('email berhasil dikirim : '+info.response);
                    }
                });
                console.log('running a task at minute');
            }, {
                scheduled: false
            });
            if (dateNow == dueDate) {
                task.start();
                
            }
            
        })
    });
    console.log('running a task');
});


io.on('connection', function(socket){
    console.log('made socket connection', socket.id)
    // io.emit("firstEvent", "Hello World")
    socket.on("newUser", (username) => {
        console.log('username : '+username);
        addNewUser(username, socket.id);
    });
    //req booking
    socket.on("reqBooking", ({senderId, name, id_item, title, text}) => {
        Users.findAll()
        .then((member) => {
            member.forEach(i => {
                if (i.role == "admin") {
                    const filePath = path.join(__dirname, 'public/template/reqBooking.html');
                    const source = fs.readFileSync(filePath, 'utf-8').toString();
                    var template = handlebars.compile(source);
                    var replacements = {
                            senderId: senderId,
                            name: name,
                            id_item: id_item,
                            title: title,
                    };
                    var htmlToSend = template(replacements);
                    const mailOptions = {
                        from: 'agusdurant7@gmail.com',
                        to : i.email,
                        subject : 'ALI Library - ' + text,
                        html : htmlToSend
                    };
                    transporter.sendMail(mailOptions, function(error, info){
                        if(error){
                            console.log(error);
                        }else{
                            console.log('email berhasil dikirim : '+info.response);
                        }
                    });
                }
            });
        })
        .catch((err) => console.log(err));
        
        io.emit("getReqBooking", {
            senderId,
            name,
            title,
            text,
        });
    });
    //approve req booking
    socket.on("approveBooking", ({receiverId, email, text, name, id_item, title, subtext}) => {
        const filePath = path.join(__dirname, 'public/template/bookingApprove.html');
        const source = fs.readFileSync(filePath, 'utf-8').toString();
        var template = handlebars.compile(source);
        var replacements = {
                // senderId: senderId,
                name: name,
                id_item: id_item,
                title: title,
                subtext: subtext
        };
        var htmlToSend = template(replacements);
        const mailOptions = {
            from: 'agusdurant7@gmail.com',
            to: email,
            subject: 'ALI Library - ' + text,
            html: htmlToSend
        };
        transporter.sendMail(mailOptions, function(error, info){
            if(error){
                console.log(error);
            }else{
                console.log('email berhasil dikirim : '+info.response);
            }
        });
        console.log('onlineUsers == now : '+JSON.stringify(onlineUsers));
        const receiver = getUser(receiverId);
        console.log('ini receiver ======= '+ receiver );
        console.log('ini receiver1 ======= '+receiverId);
        if (receiver !== undefined) {
            io.to(receiver.socketId).emit("getApproveBooking", {
                // receiverId,
                // name,
                title,
                text,
            });
        }
        
    });

    //request extend borrow
    socket.on("reqExtend", ({senderId, name, id_item, title, borrowDate, dueDate, text}) => {
        Users.findAll()
        .then((member) => {
            member.forEach(i => {
                if (i.role == "admin") {
                    const filePath = path.join(__dirname, 'public/template/reqExtend.html');
                    const source = fs.readFileSync(filePath, 'utf-8').toString();
                    var template = handlebars.compile(source);
                    var replacements = {
                            senderId: senderId,
                            name: name,
                            id_item: id_item,
                            title: title,
                            borrowDate: borrowDate,
                            dueDate: dueDate,
                    };
                    var htmlToSend = template(replacements);
                    const mailOptions = {
                        from: 'agusdurant7@gmail.com',
                        to : i.email,
                        subject : 'ALI Library - ' + text,
                        html : htmlToSend
                        };
                        transporter.sendMail(mailOptions, function(error, info){
                        if(error){
                            console.log(error);
                        }else{
                            console.log('email berhasil dikirim : '+info.response);
                        }
                    });
                }
            });
        })
        .catch((err) => console.log(err));
        
        io.emit("getReqExtend", {
            senderId,
            name,
            title,
            text,
        });
    });

    //approve req extend
    socket.on("approveExtend", ({receiverId, email, name, id_item, title, text, subtext}) => {
        const filePath = path.join(__dirname, 'public/template/extendApprove.html');
        const source = fs.readFileSync(filePath, 'utf-8').toString();
        var template = handlebars.compile(source);
        var replacements = {
                // senderId: senderId,
                name: name,
                id_item: id_item,
                title: title,
                // extendDate: extendDate,
                subtext: subtext,
        };
        var htmlToSend = template(replacements);
        const mailOptions = {
            from: 'agusdurant7@gmail.com',
            to: email,
            subject: 'ALI Library - ' + text,
            html: htmlToSend
        };
        transporter.sendMail(mailOptions, function(error, info){
            if(error){
                console.log(error);
            }else{
                console.log('email berhasil dikirim : '+info.response);
            }
        });

        // console.log('onlineUsers == now : '+JSON.stringify(onlineUsers));
        const receiver = getUser(receiverId);
        console.log('ini receiver ======= '+ receiver );
        console.log('ini receiver1 ======= '+receiverId);
        if (receiver !== undefined) {
            io.to(receiver.socketId).emit("getApproveExtend", {
                // receiverId,
                // name,
                title,
                text,
            });
        }
        
    });

    //bannedAccount
    socket.on("statusAccount", ({activeDate, receiverId, id}) => {
        // let accountActiveDate = new Date(activeDate);
        let tgl = new Date(activeDate).getDate();
        let bln = new Date(activeDate).getMonth()+1;
        let thn = new Date(activeDate).getFullYear();

        var task = cron.schedule(`0 0 ${tgl} ${bln} *`, () => {
            Users.update({ status_users: "active" }, {
                where: {
                    id_pegawai: receiverId
                }
            });
        });
        task.stop();
        
    });

    socket.on("disconnect", () => {
        removeUser(socket.id);
    });
});



