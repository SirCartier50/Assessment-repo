const {Client} = require('pg')

//create new client with credentials to be ready for later use
const client = new Client({
    host: "localhost",
    user: "postgres",
    port: 5432,
    password: "Idolisticillusion",
    database: "test_database"
});

module.exports = client