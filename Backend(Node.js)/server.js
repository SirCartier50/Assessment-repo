const express = require('express');
const client = require('./database/connection.js');
const passport = require('passport');
const app = express();

app.set('view engine', 'ejs');
app.use(loggingMware);


//middleware for logging request information
function loggingMware(req, res, next){
    console.log("original Url: " + req.originalUrl + "\nmethod: " + req.method);
    next();
}

//router linking to data.js page
const apiRouter = require('./routes/data');
app.use("/data", apiRouter);

//listen for connections on port 8080
app.listen(8080, () => {console.log("server is live: http://localhost:8080\n\ngo to this url to access api: http://localhost:8080/data")});

//connect to PostgreSQL database
client.connect();

//This is used to handle conversion to and from json
const bodyParser = require("body-parser");
app.use(bodyParser.json());

//READ route to get all users information
app.get('/users', (req, res) => {
    client.query(`Select * from users`, (err, result)=>{
        if(!err){
            res.send(result.rows);
        }
    });
    client.end;
})

//CREATE route to create new users with given information
app.post('/users', (req, res)=> {
    const user = req.body;
    let insertQuery = `insert into users(id, firstname, lastname, access) 
                       values(${user.id}, '${user.firstname}', '${user.lastname}', '${user.access}')`

    client.query(insertQuery, (err, result)=>{
        if(!err){
            res.send('Insertion was successful')
        }
        else{ console.log(err.message) }
    })
    client.end;
})

//READ route to get specific user information
app.get('/users/:id', (req, res)=>{
    client.query(`Select * from users where id=${req.params.id}`, (err, result)=>{
        if(!err){
            res.send(result.rows);
        }
    });
    client.end;
})

//UPDATE route to update specific user information
app.put('/users/:id', (req, res)=> {
    let user = req.body;
    let updateQuery = `update users
                       set firstname = '${user.firstname}',
                       lastname = '${user.lastname}',
                       access = '${user.access}'
                       where id = ${user.id}`

    client.query(updateQuery, (err, result)=>{
        if(!err){
            res.send('Update was successful')
        }
        else{ console.log(err.message) }
    })
    client.end;
})

//DELETE route to delete a user
app.delete('/users/:id', (req, res)=> {
    let insertQuery = `delete from users where id=${req.params.id}`

    client.query(insertQuery, (err, result)=>{
        if(!err){
            res.send('Deletion was successful')
        }
        else{ console.log(err.message) }
    })
    client.end;
})

