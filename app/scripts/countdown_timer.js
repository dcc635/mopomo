(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  define(['jquery', 'moment'], function($, moment) {
    var CountdownTimer, REFRESH_MS;
    REFRESH_MS = 70;
    return CountdownTimer = (function() {
      function CountdownTimer(start_ms) {
        this.start_ms = start_ms;
        this.start = __bind(this.start, this);
        this.stop = __bind(this.stop, this);
        this.refresh = __bind(this.refresh, this);
        this.reset();
      }

      CountdownTimer.prototype.padLeftZeros = function(number, padding) {
        var numberStr;
        numberStr = '' + number;
        while (numberStr.length < padding) {
          numberStr = '0' + numberStr;
        }
        return numberStr;
      };

      CountdownTimer.prototype.displayMoment = function() {
        var hours, milliseconds, minutes, seconds, timestamp;
        hours = this.padLeftZeros(this.duration.hours(), 2);
        minutes = this.padLeftZeros(this.duration.minutes(), 2);
        seconds = this.padLeftZeros(this.duration.seconds(), 2);
        milliseconds = this.padLeftZeros(Math.floor(this.duration.milliseconds() / 10), 2);
        timestamp = "" + hours + ":" + minutes + ":" + seconds + ":" + milliseconds;
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
        console.log('refreshing');
        console.log(this.duration);
        this.duration.add(this.getElapsed(), 'ms');
        console.log(this.duration);
        if (this.duration.asMilliseconds() < 0) {
          this.duration = moment.duration(0);
          this.stop();
          return this.displayMoment();
        } else {
          this.displayMoment();
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
        console.log('setting interval');
        return this.interval = setTimeout(this.refresh, REFRESH_MS);
      };

      CountdownTimer.prototype.reset = function(ms) {
        if (ms == null) {
          ms = this.start_ms;
        }
        this.stop();
        this.start_ms = ms;
        this.duration = moment.duration(ms);
        return this.displayMoment();
      };

      return CountdownTimer;

    })();
  });

}).call(this);
