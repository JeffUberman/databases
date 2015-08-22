var bluebird = require('bluebird');
var models = bluebird.promisifyAll(require('../models'));
var headers = defaultCorsHeaders;


module.exports = {
  messages: {
    get: function (req, res) {
      models.messages.get(res);

    }, // a function which handles a get request for all messages
    post: function (req, res) {
      var statusCode = 201;
      var cleanData;

      request.on('data', function(data) {


        messageData.results.push(cleanData);
        console.log(messageData + "this is the POSTed message");
      })

      response.writeHead(statusCode, headers);
      response.end('got your message!');
    } // a function which handles posting a message to the database
  },

  users: {
    // Ditto as above
    get: function (req, res) {},
    post: function (req, res) {}
  }
};

var defaultCorsHeaders = {
  "access-control-allow-origin": "*",
  "access-control-allow-methods": "GET, POST, PUT, DELETE, OPTIONS",
  "access-control-allow-headers": "content-type, accept",
  "access-control-max-age": 10 // Seconds.
};

