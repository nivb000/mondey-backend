const Pool = require("pg").Pool
const dotenv = require('dotenv')
dotenv.config()

const pool = new Pool({
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  host: process.env.DB_HOST,
  port: 5432,
  database: process.env.DB_DATABASE,
  ssl: true
})

module.exports = pool

//FOR LOCALHOST DB
// user: "postgres",
// password: "1234567niv",
// host: "localhost",
// port: 5432,
// database: "mondeyDB"