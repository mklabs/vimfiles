(function() {

  var app = window.{{ appName }} = Object.create(Backbone.Events);

  app.init = function() {
    console.log('>> Bootstrap application');
  };

  $(app.init);
})();
