
var fs = require('fs'),
  path = require('path'),
  nopt = require('nopt'),
  http = require('http'),
  marked = require('marked'),
  Reactor = require('./reactor'),
  exists = fs.existsSync || path.existsSync;


// module exports

var mp = module.exports;


// cli options

var opts = nopt().argv,
  file = opts.remain[0];

if(!file) throw new Error('Missing file argument');

file = path.resolve(file);

if(!exists(file)) throw new Error('Invalid file: ' + file);

// server creation
var server = http.createServer(function(req, res) {

  fs.readFile(file, 'utf8', function(e, body) {
    if(e) res.end('Got error: ', e.message);
    res.end(body);
  });

}).listen(opts.port || 3000, console.log.bind(console, 'Listening on', opts.port || 3000));


// reactor object / establish connection
var reactor = new Reactor({
  server: server
});


console.log(reactor);

// console.log('Watching...', file);
// fs.watchFile(file, function(curr, prev) {
// });
