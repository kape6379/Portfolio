var mysql = require('mysql');

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "University!6",
  database: "PawTrax"
});

con.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
  con.query("select * from dog", function (err, result, fields) {
    if (err) throw err;
    console.log(result);
  });
});