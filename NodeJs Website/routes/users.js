const bodyParser = require('body-parser');
const urlEncodedParser = bodyParser.urlencoded({extended : false});
const connectionDb = require('../dbConnection.js');

module.exports = function(app){

    //LOGIN
    app.get('/login.html', (req,res) => {
        res.render('login');
    });

    app.get('/', (req,res)=>{
        res.render('login');
    });

    app.post('/login', urlEncodedParser, (req,res) => {
        //TODO user null
        connectionDb.query('SELECT * FROM users WHERE username = ?', [req.body.username], (err,rows)=>{
            if(err) throw err;
            if(req.body.password == rows[0].password){
                res.redirect('index.html/id=' + rows[0].user_id);
                console.log('Uspesno logovanje')
            }else{
                res.redirect('login.html');
            }
        });
    });
    //LOGIN END


    //REG
    app.get('/registration.html', (req,res)=>{
        res.render('registration');
    });

    app.post('/registration', urlEncodedParser, (req,res) => {
        let query = 'INSERT INTO users (username,name,password) VALUES (?,?,?)';
        let value = [req.body.username, req.body.name, req.body.password];
        connectionDb.query(query,value, (err,rows)=>{
            if(err) throw err;
            console.log('Uspesno registrovanje')
        });
        res.render('login');
    });
    //REG END

}