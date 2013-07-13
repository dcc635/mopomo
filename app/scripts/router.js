(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['jquery', 'underscore', 'backbone', 'moment', 'models/timer', 'views/timerInput', 'views/timerOutput'], function($, _, Backbone, moment, TimerModel, TimerInputView, TimerOutputView) {
    var AppRouter, _ref;
    AppRouter = (function(_super) {
      __extends(AppRouter, _super);

      function AppRouter() {
        _ref = AppRouter.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      AppRouter.prototype.initialize = function() {
        this.timerModel = new TimerModel(5000);
        this.timerInputView = new TimerInputView({
          model: this.timerModel
        });
        return this.timerOutputView = new TimerOutputView({
          model: this.timerModel
        });
      };

      AppRouter.prototype.routes = function() {
        return {
          '': 'timer'
        };
      };

      AppRouter.prototype.timer = function() {
        $('#timer-input').html(this.timerInputView.render().el);
        return $('#timer-output').html(this.timerOutputView.render().el);
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
