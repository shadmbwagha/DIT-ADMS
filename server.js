const express = require('express');
const mysql = require('mysql');
const bodyParser = require('body-parser')

const db =  mysql.createConnection({
    host : 'localhost',
    user : 'root',
    password : '',
    database : 'DIT_ADMS3'
});

db.connect((err)=> {
    if(err){
        throw err;
    }
    console.log('Mysql connected...');
});

//exress app
const app = express();
app.set('view engine', 'pug');
app.set('views', './src/views');
app.use('/images', express.static('images'));

app.listen(3000);


app.get('/', ((req, res)=>{
    db.query('SELECT * FROM departments', (err, rows) => {
        if (err) {
            console.error('MySQL query error:', err);
            return res.status(500).send('Internal Server Error');
        }
        console.log(rows);
        res.render('department.pug', { departments: rows });    
    });  
}));
app.get('/departments', ((req, res)=>{
    db.query('SELECT * FROM departments', (err, rows) => {
        if (err) {
            console.error('MySQL query error:', err);
            return res.status(500).send('Internal Server Error');
        }
        console.log(rows);
        res.render('department.pug', { departments: rows });    
    });  
}));

app.get('/departmentForm', ((req, res)=>{
    db.query('SELECT * FROM departments', (err, rows) => {
        if (err) {
            console.error('MySQL query error:', err);
            return res.status(500).send('Internal Server Error');
        }
        console.log(rows);
        res.render('departmentForm.pug', { departments: rows });    
    });  
}));

app.get('/classes', ((req, res)=>{
    db.query('SELECT * FROM classes', (err, rows) => {
        if (err) {
            console.error('MySQL query error:', err);
            return res.status(500).send('Internal Server Error');
        }
        console.log(rows);
        res.render('department.pug', { departments: rows });    
    });  
}));

app.get('/curricula', ((req, res)=>{
    db.query('SELECT * FROM curricula', (err, rows) => {
        if (err) {
            console.error('MySQL query error:', err);
            return res.status(500).send('Internal Server Error');
        }
        console.log(rows);
        res.render('department.pug', { departments: rows });    
    });  
}));

app.get('/modules', ((req, res)=>{
    db.query('SELECT * FROM modules', (err, rows) => {
        if (err) {
            console.error('MySQL query error:', err);
            return res.status(500).send('Internal Server Error');
        }
        console.log(rows);
        res.render('department.pug', { departments: rows });    
    });  
}));


