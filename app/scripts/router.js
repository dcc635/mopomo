(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['jquery', 'underscore', 'backbone', 'moment', 'countdown_timer'], function($, _, Backbone, moment, CountdownTimer) {
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
        var countdownTimer;
        countdownTimer = new CountdownTimer(5, 'seconds');
        return $('button').on('click', function() {
          return countdownTimer.start();
        });
      };

      return AppRouter;

    })(Backbone.Router);
    return {
      initialize: function() {
        var app_router;
        return app_router = new AppRouter();
      }
    };
  });

}).call(this);
