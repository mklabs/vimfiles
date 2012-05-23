
var nopt = require('nopt'),
  parse = require('url').parse,
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
  host: String
});

var port = opts.port || 9222,
  host = opts.host || 'localhost';

// Chrome runs an HTTP handler listing available tabs

request({ uri: 'http://localhost:9222/json', json: true }, function(err, res, tabs) {
  if(err) return error(err);

  // First seems to always be the active tab, which we want
  var tab = tabs[0];

  // connect to first tab via the WS URL
  var url = 'http://' + host + ':' + port + parse(tab.webSocketDebuggerUrl).pathname;
  console.log('... Connect to url ...', url);

  var ws = new WebSocket.Client(url);
  ws.onopen = function(event) {
    // tell Chrome to navigate to twitter.com and look for "chrome" tweets
    ws.send(JSON.stringify({
      id: 2,
      method: 'Page.navigate',
      params: {
        url: 'http://twitter.com/#!/search/chrome?q=chrome'
      }
    }));

  };

});


// Utilities
// ---------

function error(err) {
  if(!err) return;
  console.error('... Oh snap ...');
  console.error(err.stack);
  process.exit(err.code || 1);
}

