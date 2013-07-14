(function() {
  define([], function() {
    return {
      padLeftZeros: function(number, padding) {
        var numberStr;
        numberStr = '' + number;
        while (numberStr.length < padding) {
          numberStr = '0' + numberStr;
        }
        return numberStr;
      }
    };
  });

}).call(this);
