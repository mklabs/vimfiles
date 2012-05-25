
var nopt = require('nopt'),
  events = require('events'),
  util = require('util'),
  parse = require('url').parse,
  request = require('request'),
  WebSocket = require('faye-websocket');

//
// All based and derived on: http://www.igvita.com/2012/04/09/driving-google-chrome-via-websocket-api
//
// The remote debugging protocol is... I don't have words right now.
// Other than thanks thanks thanks thanks x10e901920
//

// cli args
var opts = nopt({
  // remote debugging port
  port: Number,
  // remote host, lolcathost most of the times
  host: String,

  // command
  command: String
});

opts.port = opts.port || 9222;
opts.host = opts.host || 'localhost';


// Route to the given command
process.nextTick(function() {
  var client = new Client(opts);
  client.on('error', error);

  if(!opts.command) return;

  opts.tab = opts.tab || 0;
  opts.params = opts.params || {};
  if(opts.command === 'Runtime.Evaluate') return client.evaluate(opts.tab, {
    expression: opts['params-expression']
  });

  client.send(opts.tab, opts.command, opts.params);
});

function Client(opts) {
  this.connected = false;
  this.opts = opts || {};
  events.EventEmitter.call(this);
}

util.inherits(Client, events.EventEmitter);

// increment the request number
Client.prototype.id = function id() {
  this._id = this._id || 0;
  return ++this._id;
};

// force the process to quit
Client.prototype.end = function() {
  return process.exit(0);
};

// Chrome runs an HTTP handler listing available tabs
Client.prototype.tabs = function tabs(cb) {
  request({
    json: true,
    uri: 'http://' + opts.host + ':' + opts.port + '/json'
  }, function(err, res, tabs) {
    if(err) return cb(err);
    tabs = tabs.map(function(t) {
      if(!t.webSocketDebuggerUrl) return t;

      var pathname = parse(t.webSocketDebuggerUrl).pathname;
      t.webSocketDebuggerUrl = 'http://' + opts.host + ':' + opts.port + pathname;
      return t;
    });
    cb(null, tabs);
  });
};

// XXX
// - validate command
// - implement part of the api as domain, mapping the spec (Page,
// Runtime, ...)
//
Client.prototype.send = function send(tabIndex, command, params) {
  var self = this;
  this.tabs(function(err, tabs) {
    if(err) return this.emit('error', err);
    var tab = tabs[tabIndex];

    var ws = new WebSocket.Client(tab.webSocketDebuggerUrl);
    ws.onopen = function() {
      var data = JSON.stringify({
        id: self.id(),
        method: command,
        params: params
      });

      ws.send(data);
    };

    ws.onmessage = function(event) {
      console.log('message', event.data);
      self.end();
    };

  });
};

Client.prototype.evaluate = function evaluate(tabIndex, params) {
  var self = this;
  this.tabs(function(err, tabs) {
    if(err) return this.emit('error', err);
    var tab = tabs[tabIndex];

    if(!tab.webSocketDebuggerUrl) return self.emit('error', new Error('Unable to guess webSocketDebuggerUrl'));

    var ws = new WebSocket.Client(tab.webSocketDebuggerUrl);
    ws.onopen = function() {
      var data = JSON.stringify({
        id: self.id(),
        method: 'Runtime.evaluate',
        params: params
      });

      ws.send(data);
    };

    ws.onmessage = function(event) {
      console.log('message', event.data);
      self.end();
    };

  });
};

// Utilities
// ---------

function error(err) {
  if(!err) return;
  console.error('... Oh snap ...');
  console.error(err.stack);
  process.exit(err.code || 1);
}

