(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __slice = [].slice;

  define(['jquery', 'moment'], function($, moment) {
    var CountdownTimer;
    return CountdownTimer = (function() {
      CountdownTimer.prototype.to_secs = function(mils) {
        return mils * 1000;
      };

      CountdownTimer.prototype.reset = function() {
        this.start_seconds = this.seconds;
        console.log("reset seconds: " + this.seconds);
        return console.log("reset start_seconds: " + this.start_seconds);
      };

      function CountdownTimer() {
        var args;
        args = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
        this.start = __bind(this.start, this);
        this.stop = __bind(this.stop, this);
        this.refresh = __bind(this.refresh, this);
        console.log("Constructor args: " + args);
        this.duration = moment.duration.apply(moment, args).asMilliseconds();
        console.log("Constructor duration: " + this.duration);
        this.reset();
      }

      CountdownTimer.prototype.format_seconds = function(seconds) {
        var hours, minutes;
        hours = Math.floor(seconds / (60 * 60));
        minutes = Math.floor((seconds % 60) / 60);
        seconds = Math.floor((seconds % 60) % 60);
        return "" + hours + ":" + minutes + ":" + seconds;
      };

      CountdownTimer.prototype.refresh = function() {
        var timestamp;
        console.log("Current time: " + this.seconds);
        this.duration.subtract(1, 's');
        this.seconds--;
        timestamp = this.format_seconds(this.seconds);
        return $('.clock').html(timestamp);
      };

      CountdownTimer.prototype.stop = function() {
        return clearInterval(this.interval);
      };

      CountdownTimer.prototype.start = function() {
        console.log("start seconds: " + this.seconds);
        console.log("start start_seconds: " + this.start_seconds);
        this.interval = setInterval(this.refresh, this.to_secs(1));
        return setTimeout(this.stop, this.to_secs(this.start_seconds + 1));
      };

      CountdownTimer.prototype.setTime = function(seconds) {
        return this.seconds = seconds;
      };

      return CountdownTimer;

    })();
  });

}).call(this);
