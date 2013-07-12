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
        hours: 0,
        minutes: 0,
        seconds: 0,
        milliseconds: 0
      };

      TimerModel.prototype.initialize = function(start_ms) {
        this.start_ms = start_ms;
        return this.reset();
      };

      TimerModel.prototype.getElapsed = function() {
        var elapsed, moment_now;
        moment_now = moment();
        elapsed = this.moment_last.diff(moment_now);
        this.moment_last = moment_now;
        return elapsed;
      };

      TimerModel.prototype.save_duration = function() {
        return this.set({
          hours: this.duration.hours(),
          minutes: this.duration.minutes(),
          seconds: this.duration.seconds(),
          milliseconds: this.duration.milliseconds()
        });
      };

      TimerModel.prototype.refresh = function() {
        var elapsed;
        elapsed = this.getElapsed();
        this.duration = this.duration.add(elapsed, 'ms');
        if (this.duration.asMilliseconds() <= 0) {
          this.duration = moment.duration(0);
          this.stop();
        } else {
          this.interval = setTimeout(this.refresh, REFRESH_MS);
        }
        return this.save_duration();
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
        this.duration = moment.duration(ms);
        return this.save_duration();
      };

      return TimerModel;

    })(Backbone.Model);
  });

}).call(this);
