(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['jquery', 'backbone', 'moment'], function($, Backbone) {
    var TimerModel, _ref;
    return TimerModel = (function(_super) {
      var REFRESH_MS;

      __extends(TimerModel, _super);

      function TimerModel() {
        this.start = __bind(this.start, this);
        this.stop = __bind(this.stop, this);
        this.refresh = __bind(this.refresh, this);
        this.initialize = __bind(this.initialize, this);
        _ref = TimerModel.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      REFRESH_MS = 70;

      TimerModel.prototype.defaults = {
        hours: '00',
        minutes: '00',
        seconds: '00',
        milliseconds: '00'
      };

      TimerModel.prototype.initialize = function(start_ms) {
        this.start_ms = start_ms;
        return this.reset();
      };

      TimerModel.prototype.padLeftZeros = function(number, padding) {
        var numberStr;
        numberStr = '' + number;
        while (numberStr.length < padding) {
          numberStr = '0' + numberStr;
        }
        return numberStr;
      };

      TimerModel.prototype.displayMoment = function() {
        return this.set({
          hours: this.padLeftZeros(this.duration.hours(), 2),
          minutes: this.padLeftZeros(this.duration.minutes(), 2),
          seconds: this.padLeftZeros(this.duration.seconds(), 2),
          milliseconds: this.padLeftZeros(Math.floor(this.duration.milliseconds() / 10), 2)
        });
      };

      TimerModel.prototype.getElapsed = function() {
        var elapsed, moment_now;
        moment_now = moment();
        elapsed = this.moment_last.diff(moment_now);
        this.moment_last = moment_now;
        return elapsed;
      };

      TimerModel.prototype.refresh = function() {
        this.duration.add(this.getElapsed(), 'ms');
        if (this.duration.asMilliseconds() <= 0) {
          this.duration = moment.duration(0);
          this.stop();
        } else {
          this.interval = setTimeout(this.refresh, REFRESH_MS);
        }
        return this.displayMoment();
      };

      TimerModel.prototype.stop = function() {
        if (this.interval) {
          return clearTimeout(this.interval);
        }
      };

      TimerModel.prototype.start = function() {
        this.stop();
        this.moment_last = moment();
        return this.interval = setTimeout(this.refresh, REFRESH_MS);
      };

      TimerModel.prototype.reset = function(ms) {
        if (ms == null) {
          ms = this.start_ms;
        }
        this.stop();
        this.start_ms = ms;
        this.duration = moment.duration(ms);
        return this.displayMoment();
      };

      return TimerModel;

    })(Backbone.Model);
  });

}).call(this);
