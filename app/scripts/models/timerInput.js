(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['jquery', 'backbone'], function($, Backbone) {
    var TimerInputModel, _ref;
    return TimerInputModel = (function(_super) {
      __extends(TimerInputModel, _super);

      function TimerInputModel() {
        _ref = TimerInputModel.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      TimerInputModel.prototype.defaults = {
        hours: '00',
        minutes: '00',
        seconds: '00'
      };

      return TimerInputModel;

    })(Backbone.Model);
  });

}).call(this);
