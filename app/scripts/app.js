(function() {
  define(['jquery', 'underscore', 'backbone', 'router'], function($, _, Backbone, Router) {
    var initialize;
    initialize = function() {
      Router.initialize();
      return Backbone.history.start();
    };
    return {
      initialize: initialize
    };
  });

}).call(this);
