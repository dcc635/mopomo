(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['jquery', 'backbone', 'hbs!template/timerOutput'], function($, Backbone, TimerOutputTemplate) {
    var TimerOutputView, _ref;
    return TimerOutputView = (function(_super) {
      __extends(TimerOutputView, _super);

      function TimerOutputView() {
        _ref = TimerOutputView.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      TimerOutputView.prototype.initialize = function() {
        return this.listenTo(this.model, "change", this.render);
      };

      TimerOutputView.prototype.padLeftZeros = function(number, padding) {
        var numberStr;
        numberStr = '' + number;
        while (numberStr.length < padding) {
          numberStr = '0' + numberStr;
        }
        return numberStr;
      };

      TimerOutputView.prototype.render = function() {
        this.$el.html(TimerOutputTemplate({
          hours: this.padLeftZeros(this.model.attributes.hours, 2),
          minutes: this.padLeftZeros(this.model.attributes.minutes, 2),
          seconds: this.padLeftZeros(this.model.attributes.seconds, 2),
          milliseconds: this.padLeftZeros(Math.floor(this.model.attributes.milliseconds / 10), 2)
        }));
        return this;
      };

      return TimerOutputView;

    })(Backbone.View);
  });

}).call(this);
