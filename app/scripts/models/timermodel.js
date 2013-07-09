(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['jquery', 'backbone'], function($, Backbone) {
    var TimerModel, _ref;
    return TimerModel = (function(_super) {
      __extends(TimerModel, _super);

      function TimerModel() {
        _ref = TimerModel.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      TimerModel.prototype.defaults = {
        hours: '00',
        minutes: '00',
        seconds: '00',
        milliseconds: '00'
      };

      return TimerModel;

    })(Backbone.Model);
  });

}).call(this);
