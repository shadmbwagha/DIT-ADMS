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


app.get('/createUser', (req, res) => {
    let user = {id: 1, username: 'shad', email:'a@b.c', password: '123shad'}
    let sql = 'INSERT INTO user SET ?';
    db.query(sql, user,(err, result)=> {
        if(err) throw err;
        console.log(result);
        res.send("user table created")
    })
});

app.post('/loginVerification', (req, res)=> {
    const { username, password } = req.body;

    // Check if the user exists in the database
    const query = 'SELECT * FROM user WHERE username = ? AND password = ?';
    db.query(query, [username, password], (error, results) => {
      if (error) {
        console.error('Error querying MySQL:', error);
        return res.status(500).send('Internal Server Error');
      }
      if (results.length > 0) {

        res.redirect('/getUser');

      } else {
        res.render('404.pug', {error: 'Invalid credentials'});
      }
    });
});
app.get('/', (req,res)=> {
    res.render('login.pug');
});

app.get('/register', (req,res)=> {
    res.render('register.pug');
});

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


