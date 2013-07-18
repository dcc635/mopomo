(function() {
  define(['models/timerInput'], function(TimerInputModel) {
    'use strict';
    return describe('Give it some context', function() {
      return describe('maybe a bit more context here', function() {
        return it('should run here few assertions', function() {
          var assert, foo, timerModel;
          assert = chai.assert;
          timerModel = new TimerInputModel();
          assert.equal(timerModel.attributes.hours, 1);
          foo = 'sup';
          return assert.equal(foo, 'sup');
        });
      });
    });
  });

}).call(this);
