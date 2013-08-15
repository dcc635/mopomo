define [
  'backbone',
  'models/timer',
], (TimerModel) ->

  class TimerCollection extends Backbone.Collection

    model: TimerModel
