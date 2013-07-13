(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['jquery', 'backbone', 'hbs!template/timerInput'], function($, Backbone, TimerInputTemplate) {
    var TimerInputView, _ref;
    return TimerInputView = (function(_super) {
      __extends(TimerInputView, _super);

      function TimerInputView() {
        _ref = TimerInputView.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      TimerInputView.prototype.start = function() {
        this.reset();
        return this.model.start();
      };

      TimerInputView.prototype.reset = function() {
        this.model.set({
          hours: 0,
          minutes: 0,
          seconds: 7,
          milliseconds: 0
        });
        return this.model.reset();
      };

      TimerInputView.prototype.render = function() {
        this.$el.html(TimerInputTemplate());
        this.delegateEvents({
          'click button#start': 'start',
          'click button#reset': 'reset'
        });
        return this;
      };

      return TimerInputView;

    })(Backbone.View);
  });

}).call(this);
