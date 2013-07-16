(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['jquery', 'backbone', 'moment', 'modernizr'], function($, Backbone, Moment, Modernizr) {
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

      TimerModel.prototype.initialize = function() {
        return this.reset();
      };

      TimerModel.prototype.getElapsed = function() {
        var elapsed, moment_now;
        moment_now = Moment();
        elapsed = this.moment_last.diff(moment_now);
        this.moment_last = moment_now;
        return elapsed;
      };

      TimerModel.prototype.save_duration = function() {
        return this.set({
          hours: Math.floor(this.duration.asHours()),
          minutes: this.duration.minutes(),
          seconds: this.duration.seconds(),
          milliseconds: this.duration.milliseconds()
        });
      };

      TimerModel.prototype.refresh = function() {
        var audioElement, elapsed;
        elapsed = this.getElapsed();
        this.duration = this.duration.add(elapsed, 'ms');
        if (this.duration.asMilliseconds() > 0) {
          this.interval = setTimeout(this.refresh, REFRESH_MS);
        } else {
          this.duration = Moment.duration(0);
          this.stop();
          Modernizr.addTest('notifications', function() {
            if (window.webkitNotifications.checkPermission() === 0) {
              this.notification = window.webkitNotifications.createNotification('', 'MoPomo Complete', 'Click to return to timer');
              return this.notification.show();
            }
          });
          audioElement = document.createElement('audio');
          audioElement.setAttribute('src', 'http://cd.textfiles.com/10000soundssongs/WAV/DING1.WAV');
          audioElement.setAttribute('autoplay', 'autoplay');
          $.get();
          audioElement.addEventListener("load", function() {
            return audioElement.play();
          }, true);
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
        this.moment_last = Moment();
        return this.interval = setTimeout(this.refresh, REFRESH_MS);
      };

      TimerModel.prototype.reset = function() {
        this.stop();
        this.duration = Moment.duration(this.attributes);
        return this.save_duration();
      };

      return TimerModel;

    })(Backbone.Model);
  });

}).call(this);
