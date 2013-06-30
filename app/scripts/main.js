(function() {
  "use strict";
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

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
    var AppRouter, app, refresh, _ref;
    refresh = function() {
      var x;
      x = moment().format('h:mm:ss a');
      console.log(moment().format());
      return $('#clock').html(x);
    };
    AppRouter = (function(_super) {
      __extends(AppRouter, _super);

      function AppRouter() {
        _ref = AppRouter.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      AppRouter.prototype.routes = function() {
        return {
          "": "clock"
        };
      };

      AppRouter.prototype.clock = function() {
        return setInterval(refresh, 5);
      };

      return AppRouter;

    })(Backbone.Router);
    app = new AppRouter();
    return Backbone.history.start();
  });

}).call(this);
