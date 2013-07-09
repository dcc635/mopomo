define [
  'jquery',
  'backbone',
], ($, Backbone) ->

  class TimerModel extends Backbone.Model
    defaults: {
      hours: '00',
      minutes: '00',
      seconds: '00',
      milliseconds: '00'
    }