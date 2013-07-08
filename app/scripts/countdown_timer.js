(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  define(['jquery', 'moment'], function($, moment) {
    var CountdownTimer, REFRESH_MS;
    REFRESH_MS = 70;
    return CountdownTimer = (function() {
      CountdownTimer.prototype.to_secs = function(mils) {
        return mils * 1000;
      };

      function CountdownTimer(ms) {
        this.start = __bind(this.start, this);
        this.stop = __bind(this.stop, this);
        this.refresh = __bind(this.refresh, this);
        this.start_ms = ms;
        this.moment = moment(ms);
        this.moment.hours(0);
        this.moment.days(1);
      }

      CountdownTimer.prototype.display_moment = function() {
        var timestamp;
        timestamp = this.moment.format("HH:mm:ss:SS");
        return $('.clock').html(timestamp);
      };

      CountdownTimer.prototype.getElapsed = function() {
        var elapsed, moment_now;
        moment_now = moment();
        elapsed = this.moment_last.diff(moment_now);
        this.moment_last = moment_now;
        return elapsed;
      };

      CountdownTimer.prototype.refresh = function() {
        this.moment.add('ms', this.getElapsed());
        if (this.moment.days() === 1 && this.moment.hours() === 0 && this.moment.minutes() === 0 && this.moment.seconds() === 0 && this.moment.milliseconds() <= REFRESH_MS) {
          this.moment = moment([0, 0, 0, 0, 0, 0, 0]);
          this.display_moment();
          return this.stop();
        } else {
          this.display_moment();
          return this.interval = setTimeout(this.refresh, REFRESH_MS);
        }
      };

      CountdownTimer.prototype.stop = function() {
        if (this.interval) {
          return clearTimeout(this.interval);
        }
      };

      CountdownTimer.prototype.start = function() {
        this.stop();
        this.moment_last = moment();
        return this.interval = setTimeout(this.refresh, REFRESH_MS);
      };

      CountdownTimer.prototype.setTime = function(ms) {
        return this.moment.milliseconds(ms);
      };

      CountdownTimer.prototype.reset = function() {
        this.stop();
        this.moment = moment(this.start_ms);
        this.moment.hours(0);
        this.moment.days(1);
        return this.display_moment();
      };

      return CountdownTimer;

    })();
  });

}).call(this);
