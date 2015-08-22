var db = require('../db');
var mysql = require('mysql');
var connection = mysql.createConnection({
  host: '127.0.0.1',
  user: 'root',
  password: 'taco',
  database: 'chat'
});

connection.connect();


module.exports = {
  messages: {
    get: function (res, cb) {
      console.log('This is inside get right before connection query');
      var data;
      connection.query('SELECT * FROM messages, users, rooms WHERE users.id = messages.user_id', function(err, rows, fields) {
      console.log('this is rows: ', rows);
      if(err) {
        throw err;
      }
      var results = [];
      for(var i = 0; i < rows.length; i ++) {
        results.push({username: rows[i].username, roomname: rows[i].roomname, text: rows[i].message})
      }
      console.log('results after looping through data: ', results);
      res.send(JSON.stringify({results: results}));
      });

    }, // a function which produces all the messages
    post: function () {

    } // a function which can be used to insert a message into the database
  },

  users: {
    // Ditto as above.
    get: function () {},
    post: function () {}
  }
};

