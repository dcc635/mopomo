(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(["jquery", "underscore", "backbone", "moment"], function($, _, Backbone, moment) {
    var AppRouter, _ref;
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
        var clickStart, refresh, saveTime, stopTimer, timerMoment;
        timerMoment = moment([0, 0, 0, 0, 0, 4, 0]);
        refresh = function() {
          var timestamp;
          timerMoment.subtract('seconds', 1);
          timestamp = timerMoment.format('HH:mm:ss');
          return $('.clock').html(timestamp);
        };
        stopTimer = function(intervalHandler) {
          return clearInterval(intervalHandler);
        };
        saveTime = function() {
          return timerMoment = moment([0, 0, 0, 0, 0, 10, 0]);
        };
        clickStart = function() {
          var intervalHandler;
          saveTime();
          intervalHandler = setInterval(refresh, 1000);
          return setTimeout(function() {
            return stopTimer(intervalHandler);
          }, 5000);
        };
        return $('button').on('click', function() {
          return clickStart();
        });
      };

      return AppRouter;

    })(Backbone.Router);
    return {
      initialize: function() {
        var app_router;
        app_router = new AppRouter();
        return Backbone.history.start();
      }
    };
  });

}).call(this);
