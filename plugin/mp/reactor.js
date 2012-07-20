
var fs = require('fs'),
  path = require('path'),
  util = require('util'),
  http = require('http'),
  events = require('events'),
  WebSocket = require('faye-websocket');

// XXX
// - use socket.io instead of faye-websocket
// - inject client side script
// - pre-render md using marked + basic style

module.exports = Reactor;

function Reactor(options) {
  this.sockets = {};
  if(!options.server) throw new Error('Missing server option');

  this.server = options.server;
  if(!(this.server instanceof http.Server)) throw new Error('Is not a valid HTTP server');

  this.options = options || {};
  this.uid = 0;

  this.start(options);
}

util.inherits(Reactor, events.EventEmitter);

// send a reload command on all stored web socket connection
Reactor.prototype.reload = function reload(files) {
  var self = this,
    sockets = this.sockets,
    changed = files.changed;

  // go through all sockets, and emit a reload command
  Object.keys(sockets).forEach(function(id) {
    var ws = sockets[id],
      version = ws.livereloadVersion;

    // go throuh all the files that has been marked as changed by grunt
    // and trigger a reload command on each one, for each connection.
    changed.forEach(self.reloadFile.bind(self, ws, version));
  });
};

Reactor.prototype.reloadFile = function reloadFile(ws, version, filepath) {
  filepath = path.resolve(filepath);

  // support both "refresh" command for 1.6 and 1.7 protocol version
  var data = version === '1.6' ? ['refresh', {
    path: filepath,
    apply_js_live: true,
    apply_css_live: true
  }] : {
    command: 'reload',
    path: filepath,
    liveCSS: true,
    liveJS: true
  };

  this.send(ws, data);
};

Reactor.prototype.start = function start(options) {
  // setup socket connection
  this.server.on('upgrade', this.connection.bind(this));
};

Reactor.prototype.connection = function connection(request, socket, head) {
  var ws = new WebSocket(request, socket, head),
    self = this,
    wsId = this.uid = this.uid + 1;

  // store the new connection
  this.sockets[wsId] = ws;

  ws.onmessage = function(event) {
    // message type
    if(!event.type === 'message') return console.warn('Unhandled ws message type');

    // parse the JSON data object
    var data = self.parseData(event.data);

    // attach the guessed livereload protocol version to the sokect object
    ws.livereloadVersion = data.command ? '1.7' : '1.6';
    // data sent wasn't a valid JSON object, assume version 1.6
    if(!data.command) return ws.send('!!ver:1.6');

    // valid commands are: url, reload, alert and hello for 1.7

    // first handshake
    if(data.command === 'hello') return self.hello(data, ws);

    // livereload.js emits this
    if(data.command === 'info') return self.info(data, ws);
  };

  ws.onclose = function(event) {
    ws = null;
    delete self.sockets[wsId];
  };
};

Reactor.prototype.parseData = function parseData(str) {
  var data = {};
  try {
    data = JSON.parse(str);
  } catch (e) {}
  return data;
};

Reactor.prototype.hello = function hello(data, ws) {
  this.send(ws, {
    command: 'hello',
    protocols: [
      'http://livereload.com/protocols/official-7'
    ],
    serverName: 'vmp-livereload'
  });

};

// noop
Reactor.prototype.info = function info(data, ws) {};

Reactor.prototype.send = function send(ws, data) {
  ws.send(JSON.stringify(data));
};

