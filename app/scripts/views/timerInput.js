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
        if (window.webkitNotifications.checkPermission() === !0) {
          window.webkitNotifications.requestPermission();
        }
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
        var id, _i, _len, _ref1, _results;
        _ref1 = ['#hours', '#minutes', '#seconds'];
        _results = [];
        for (_i = 0, _len = _ref1.length; _i < _len; _i++) {
          id = _ref1[_i];
          _results.push($(id).val(Util.padLeftZeros($(id).val(), 2)));
        }
        return _results;
      };

      TimerInputView.prototype.allow_only_numerals = function() {
        var id, _i, _len, _ref1, _results;
        _ref1 = ['#hours', '#minutes', '#seconds'];
        _results = [];
        for (_i = 0, _len = _ref1.length; _i < _len; _i++) {
          id = _ref1[_i];
          if (/\D/g.test($(id).val())) {
            _results.push($(id).val($(id).val().replace(/\D/g, '')));
          } else {
            _results.push(void 0);
          }
        }
        return _results;
      };

      TimerInputView.prototype.focus = function() {
        return $(this.select());
      };

      TimerInputView.prototype.render = function() {
        this.$el.html(TimerInputTemplate(this.timerInputModel.attributes));
        this.delegateEvents({
          'click button#start': 'start',
          'click button#reset': 'resetOutput',
          'keyup input': 'allow_only_numerals',
          'focusout input': 'format'
        });
        return this;
      };

      return TimerInputView;

    })(Backbone.View);
  });

}).call(this);
