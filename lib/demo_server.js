var text = require('./demo')
var express = require('express');
var app = express();

var redis = require("redis"),
    client = redis.createClient({'host': 'redis', 'port': 6379});

getClientAddress = function (req) {
            return (req.headers['x-forwarded-for'] || '').split(',')[0] 
                        || req.connection.remoteAddress;
};

app.get('/', function (req, res){
    ip = getClientAddress(req);
    if (!ip){
        res.send('Can not get your ip address.');
        return
    }
    client.get(ip, function(err, reply){
        count = 0;
        if (reply != null) {
            count = parseInt(reply) + 1;
        }
        client.set(ip, count)
        html = 'You are from ' + ip + ', access count: ' + count;
        res.send(html)
    });
});

var server = app.listen(3000, function () {
  var host = server.address().address;
  var port = server.address().port;

  console.log('Example app listening at http://%s:%s', host, port);
});
