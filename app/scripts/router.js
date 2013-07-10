(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['jquery', 'underscore', 'backbone', 'moment', 'models/timermodel', 'views/timerview'], function($, _, Backbone, moment, TimerModel, TimerView) {
    var AppRouter, _ref;
    AppRouter = (function(_super) {
      __extends(AppRouter, _super);

      function AppRouter() {
        _ref = AppRouter.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      AppRouter.prototype.initialize = function() {
        this.timerModel = new TimerModel(5000);
        return this.timerView = new TimerView({
          model: this.timerModel
        });
      };

      AppRouter.prototype.routes = function() {
        return {
          '': 'timer'
        };
      };

      AppRouter.prototype.timer = function() {
        return $('#app').html(this.timerView.render().el);
      };

      return AppRouter;

    })(Backbone.Router);
    return {
      initialize: function() {
        var appRouter;
        return appRouter = new AppRouter();
      }
    };
  });

}).call(this);
