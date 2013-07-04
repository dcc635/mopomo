(function() {
  define(['jquery'], function($) {
    var CountdownTimer;
    return CountdownTimer = (function() {
      CountdownTimer.prototype.reset = function() {
        this.start_seconds = this.seconds;
        console.log("reset seconds: " + this.seconds);
        return console.log("reset start_seconds: " + this.start_seconds);
      };

      function CountdownTimer(seconds) {
        this.seconds = seconds;
        console.log("Constructor seconds: " + this.seconds);
        this.reset();
      }

      CountdownTimer.prototype.format_seconds = function(seconds) {
        var hours, minutes;
        hours = Math.floor(seconds / (60 * 60));
        minutes = Math.floor((seconds % 60) / 60);
        seconds = Math.floor((seconds % 60) % 60);
        return "" + hours + ":" + minutes + ":" + this.seconds;
      };

      CountdownTimer.prototype.refresh = function() {
        var timestamp;
        console.log("Current time: " + this.seconds);
        this.seconds--;
        timestamp = this.format_seconds(this.seconds);
        return $('.clock').html(timestamp);
      };

      CountdownTimer.prototype.stop = function() {
        return clearInterval(this.interval);
      };

      CountdownTimer.prototype.start = function() {
        var that;
        console.log("start seconds: " + this.seconds);
        console.log("start start_seconds: " + this.start_seconds);
        that = this;
        return this.interval = setInterval(function() {
          return that.refresh();
        }, 1000);
      };

      CountdownTimer.prototype.setTime = function(seconds) {
        return this.seconds = seconds;
      };

      return CountdownTimer;

    })();
  });

}).call(this);
