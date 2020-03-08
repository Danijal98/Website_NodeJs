const connectionDb = require('../dbConnection.js');
const multer = require('multer');
const path = require('path');

/* MULTER */
const storage = multer.diskStorage({
    destination: './media/newsPics/',
    filename: function(req, file, cb){
        cb(null, file.fieldname + Date.now() + path.extname(file.originalname));
    }
});

const upload = multer({
    storage: storage,
    limits:{fileSize: 1000000},
    fileFilter: function(req, file, cb){
        checkFileType(file, cb);
    }
}).single('newsPhoto');

function checkFileType(file, cb){
    const fileTypes = /jpeg|jpg|png|gif/;
    const extname = fileTypes.test(path.extname(file.originalname).toLowerCase());
    const mimetype = fileTypes.test(file.mimetype);

    if(mimetype && extname){
        return cb(null, true);
    }else{
        cb('Not a photo');
    }
}

/* MULTER */

module.exports = function(app){

    //NEWS DETAILS
    app.get('/news', (req,response)=>{
        let news_id = req.query.news_id;
        let user_id = req.query.user_id;
        let admin;
        let name;
        let news_title;
        let news_text;
        let news_image;
        let queryNews = 'SELECT * FROM news WHERE news_id = ' + news_id;
        let queryComments = 'SELECT text_komentara, comment_id, users.name FROM `comments` JOIN news USING (news_id) JOIN users USING (user_id) WHERE news_id = ' + news_id;
        let queryUser = 'SELECT * FROM users WHERE user_id = ' + user_id;
        
        connectionDb.query(queryUser, (req,user)=>{
            admin = user[0].admin;
            name = user[0].name;
            connectionDb.query(queryNews, (req, res)=>{
                news_title = res[0].title;
                news_text = res[0].text;
                news_image = res[0].pic_path;
                connectionDb.query(queryComments, (req,komentari)=>{
                    response.render('news', {user_id:user_id, news_id:news_id, admin:admin, 
                        name:name, title:news_title, text:news_text, photo:news_image, data:komentari});
                });
            });
        });
        
    });
    //NEWS DETAILS

    //ADD COMMENT
    app.post('/addComment', (req,response)=>{
        let news_id = req.body.news_id;
        let user_id = req.body.user_id;
        let text = req.body.text;
        let queryComment = 'INSERT INTO comments (user_id,news_id,text_komentara) VALUES (?,?,?)';
        let values = [user_id,news_id,text];
        connectionDb.query(queryComment,values,(err,res)=>{
            if(err) throw err;
            console.log('Uspesno dodavanje komentara');
            response.redirect('/news?news_id=' + news_id + '&user_id=' + user_id);
        });
    });
    //ADD COMMENT

    //DELETE COMMENT
    app.post('/deleteComment', (req,response)=>{
        let user_id = req.body.user_id;
        let news_id = req.body.news_id;
        let comment_id = req.body.comment_id;
        let query = 'DELETE FROM comments WHERE comment_id = ' + comment_id;
        connectionDb.query(query, (err,res)=>{
            if(err) throw err;
            console.log('Uspesno brisanje komentara');
            response.redirect('/news?news_id=' + news_id + '&user_id=' + user_id);
        });
    });
    //DELETE COMMENT


    //HOMEPAGE
    app.get('/index.html/:id', (req,res)=>{
        let queryNews = 'SELECT * FROM news';
        let id = req.params.id.substring(3);
        let admin;
        let name;
        connectionDb.query('SELECT * FROM users WHERE user_id = ?', [id], (err,user)=>{
            if(err) throw err;
            admin = user[0].admin;
            name = user[0].name;
        });
        connectionDb.query(queryNews, (err,rows)=>{
            if(err) throw err;
            res.render('index',{admin:admin, name:name, id:id, data:rows});
        });
    });
    //HOMEPAGE END


    //DODAVANJE
    app.post('/add', (req,res)=>{
        upload(req, res, (err) =>{
            if (err) throw err;
            let query = 'INSERT INTO news (title,text,date,pic_path) VALUE (?,?,?,?)';
            let filename = (typeof req.file == 'undefined') ? 'news_pic.jpeg' : req.file.filename;
            let values = [req.body.title, req.body.text, req.body.date, filename];
            let userID = req.body.user_id;
            connectionDb.query(query,values, (err,rows)=>{
                if(err) throw err;
                console.log('Uspešno dodavanje u bazu...');
                res.redirect('index.html/id=' + userID);
            });
        });
    });

    //PRETRAGA
    app.post('/search', (req,res)=>{
        let title = req.body.title;
        let query = "SELECT * FROM `news` WHERE title LIKE '%" + title + "%' OR text LIKE '%" + title + "%'";
        let userID = req.body.user_id;
        if(title === ""){
            res.redirect('index.html/id=' + userID);
        }else{
            let id = req.body.user_id;
            let admin;
            let name;
            connectionDb.query('SELECT * FROM users WHERE user_id = ?', [id], (err,user)=>{
                if(err) throw err;
                admin = user[0].admin;
                name = user[0].name;
            });
            connectionDb.query(query, (err,rows)=>{
                if(err) throw err;
                res.render('index',{admin:admin, name:name, id:id, data:rows});
            });
        }
    });

    
    //BRISANJE
    app.post('/delete', (req,res)=>{
        let query = 'DELETE news, comments FROM news LEFT JOIN comments USING (news_id) WHERE news_id = ?'
        let id = req.body.news_id;
        let userID = req.body.user_id;
        connectionDb.query(query,id,(err,row)=>{
            if(err) throw err;
            console.log('Uspešno brisanje iz baze...');
            res.redirect('index.html/id=' + userID);
        });
    });
    

}