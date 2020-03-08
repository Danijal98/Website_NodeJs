const mysql = require('mysql');

const dbConnection = mysql.createConnection({
    host : "localhost",
    user : "root",
    password : "",
    database : "db_elgrande",
    multipleStatements : true
});

dbConnection.connect((err)=>{
    if(err) throw err;
    console.log('Connection successful');
});

module.exports = dbConnection;