const express = require('express');
const path = require('path');
const morgan = require('morgan');
const mysql = require('mysql');
const myConection = require('express-myConnection');


const app = express();

//import routes
const personaRoutes = require('./routes/persona');
const { urlencoded } = require('express');

//setings
app.set('port', process.env.PORT || 3000);
app.set('view engine','ejs');
app.set('views', path.join(__dirname, 'views'));

//midlewares
app.use(morgan('dev'))
app.use(myConection(mysql, {
    host: 'localhost',
    user: 'root',
    password: '',
    port: 3306,
    database: 'serie1'
}, 'single'));

app.use(express.urlencoded({extended: false}));

//routes
app.use('/', personaRoutes);


//statics files
app.use(express.static(path.join(__dirname, 'public')));

//start server
app.listen(app.get('port'), () => {
    console.log('Server on port 3000');
}, );

