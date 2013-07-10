(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['jquery', 'backbone', 'hbs!template/timer'], function($, Backbone, TimerTemplate) {
    var TimerView, _ref;
    return TimerView = (function(_super) {
      __extends(TimerView, _super);

      function TimerView() {
        _ref = TimerView.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      TimerView.prototype.initialize = function() {
        return this.listenTo(this.model, "change", this.render);
      };

      TimerView.prototype.start = function() {
        return this.model.start();
      };

      TimerView.prototype.reset = function() {
        return this.model.reset();
      };

      TimerView.prototype.render = function() {
        return $('#app').html(TimerTemplate(this.model.attributes));
      };

      return TimerView;

    })(Backbone.View);
  });

}).call(this);
