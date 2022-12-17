const express = require('express');

const app = express();


// parse json request body
app.use(express.json());

// parse urlencoded request body
app.use(express.urlencoded({extended: true}));

// checking the server's health
app.get('/', (req, res) => res.send('Server is healthy!'));

// define other routes here
app.get('/api/test', (req, res) => res.send('Testing route!'));

module.exports = app;
