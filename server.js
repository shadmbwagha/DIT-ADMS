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

app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());

app.get('/createUser', (req, res) => {
    let user = {id: 1, username: 'shad', email:'a@b.c', password: '123shad'}
    let sql = 'INSERT INTO user SET ?';
    db.query(sql, user,(err, result)=> {
        if(err) throw err;
        console.log(result);
        res.send("user table created")
    })
});

app.post('/authUser', (req, res)=> {
    const { email, password } = req.body;

    // Check if the user exists in the database
    const query = 'SELECT * FROM users_adms WHERE email = ? AND password = ?';
    db.query(query, [email, password], (error, results) => {
      if (error) {
        console.error('Error querying MySQL:', error);
        return res.status(500).send('Internal Server Error');
      }
      if (results.length > 0) {

        res.redirect('/departments');

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

app.post('/regUser', (req, res) => {
    const { username, email, password, password2 } = req.body;
    let user = {username: username, email:email, password: password}
    if(password == password2){
        let sql = 'INSERT INTO users_adms SET ? ';
        db.query(sql,user ,(err, result)=> {
            if(err) throw err;
            console.log(result);
            res.redirect('/')
        })
    }else{
        res.send('validation failed: paswword mismathc')
    }
    
});

app.get('/departments', ((req, res)=>{
    db.query('SELECT * FROM departments', (err, rows) => {
        if (err) {
            console.error('MySQL query error:', err);
            return res.status(500).send('Internal Server Error');
        }
        res.render('department.pug', { departments: rows });    
    });  
}));
app.get('/departmentForm', ((req, res)=>{
    res.render('departmentForm.pug');
}));

app.post('/createDepartment', ((req, res)=>{
    const { department_name } = req.body;
    let department = {department_name};
   
        let sql = 'INSERT INTO departments SET ? ';
        db.query(sql,department ,(err, result)=> {
            if(err) throw err;
            res.redirect('/departments');
        })
   
}));
app.post('/updateDepartment', ((req, res)=>{
    const { department_name } = req.body;
    let department = {department_name};
   
        let sql = 'INSERT INTO departments SET ? ';
        db.query(sql,department ,(err, result)=> {
            if(err) throw err;
            res.redirect('/departments');
        })
   
}));
app.post('/updateDepartment', ((req, res)=>{
    const { department_name } = req.body;
    let department = {department_name};
   
        let sql = 'UPDATE TABLE departments SET department_name = ? WHERE id = ?';
        db.query(sql,[department_name],department ,(err, result)=> {
            if(err) throw err;
            res.redirect('/departments');
        })
   
}));

app.get('/classes', ((req, res)=>{
    db.query('SELECT * FROM classes', (err, rows) => {
        if (err) {
            console.error('MySQL query error:', err);
            return res.status(500).send('Internal Server Error');
        }
        console.log(rows);
        res.render('classes.pug', { departments: rows });    
    });  
}));

app.get('/curricula', ((req, res)=>{
    db.query('SELECT * FROM curricula', (err, rows) => {
        if (err) {
            console.error('MySQL query error:', err);
            return res.status(500).send('Internal Server Error');
        }
        console.log(rows);
        res.render('curriculum.pug', { departments: rows });    
    });  
}));

app.get('/modules', ((req, res)=>{
    db.query('SELECT * FROM modules', (err, rows) => {
        if (err) {
            console.error('MySQL query error:', err);
            return res.status(500).send('Internal Server Error');
        }
        console.log(rows);
        res.render('modules.pug', { departments: rows });    
    });  
}));


