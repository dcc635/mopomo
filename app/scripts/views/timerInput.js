(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['jquery', 'backbone', 'util', 'hbs!template/timerInput'], function($, Backbone, Util, TimerInputTemplate) {
    var TimerInputView, _ref;
    return TimerInputView = (function(_super) {
      __extends(TimerInputView, _super);

      function TimerInputView() {
        _ref = TimerInputView.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      TimerInputView.prototype.initialize = function(timerInputModel, timerModel) {
        this.timerInputModel = timerInputModel;
        this.timerModel = timerModel;
      };

      TimerInputView.prototype.start = function() {
        this.resetOutput();
        return this.timerModel.start();
      };

      TimerInputView.prototype.resetOutput = function() {
        this.timerModel.set({
          hours: $('#hours').val(),
          minutes: $('#minutes').val(),
          seconds: $('#seconds').val(),
          milliseconds: 0
        });
        return this.timerModel.reset();
      };

      TimerInputView.prototype.format = function() {
        $('#hours').val(Util.padLeftZeros($('#hours').val(), 2));
        $('#minutes').val(Util.padLeftZeros($('#minutes').val(), 2));
        return $('#seconds').val(Util.padLeftZeros($('#seconds').val(), 2));
      };

      TimerInputView.prototype.render = function() {
        this.$el.html(TimerInputTemplate(this.timerInputModel.attributes));
        this.delegateEvents({
          'click button#start': 'start',
          'click button#reset': 'resetOutput',
          'focusout input': 'format'
        });
        return this;
      };

      return TimerInputView;

    })(Backbone.View);
  });

}).call(this);
