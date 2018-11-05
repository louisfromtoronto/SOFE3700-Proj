// MySQL Connection
const mysql = require("mysql");
const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "password"
});
db.connect(err => {
  if (err) throw err;
  console.log("Connected!");
});

// Express routing
const express = require("express");
app = express();

app.get("/createdb", (req, res) => {
  console.log("/createdb");
  let sql = "CREATE DATABASE nodemysql";
  db.query(sql, (err, result) => {
    if (err) throw err;
    console.log(result);
    res.send("Database created...");
  });
});

app.listen("3000", () => {
  console.log("Now listening on port 3000");
});
