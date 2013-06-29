(function() {
  "use strict";
  require.config({
    shim: {
      underscore: {
        exports: "_"
      },
      backbone: {
        deps: ["underscore", "jquery"],
        exports: "Backbone"
      },
      bootstrap: {
        deps: ["jquery"],
        exports: "jquery"
      }
    },
    paths: {
      jquery: "../bower_components/jquery/jquery",
      backbone: "../bower_components/backbone-amd/backbone",
      underscore: "../bower_components/underscore-amd/underscore",
      bootstrap: "vendor/bootstrap",
      moment: "../bower_components/moment/moment"
    }
  });

  require(["backbone", "moment"], function(Backbone, moment) {
    var AppRouter, app, refresh;
    refresh = function() {
      var x;
      x = moment().format('h:mm:ss');
      console.log(moment().format());
      return $('#clock').html(x);
    };
    AppRouter = Backbone.Router.extend({
      routes: {
        "": "clock"
      },
      clock: setInterval(refresh, 1000)
    });
    app = new AppRouter();
    return Backbone.history.start();
  });

}).call(this);
