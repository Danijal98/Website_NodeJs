const express = require('express');
const app = express();
const PORT = process.env.PORT || 5000;
const bodyParser = require('body-parser');

app.set('view engine', 'ejs');
app.use('/css', express.static('css'));
app.use('/js', express.static('js'));
app.use('/media', express.static('media')); 
app.use(bodyParser.urlencoded({extended: true}));

let Users = require('./routes/users');
let News = require('./routes/news');

Users(app);
News(app);

app.listen(PORT, console.log(`Listening on port ${PORT}`));