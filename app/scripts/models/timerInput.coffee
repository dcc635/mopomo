define [
  'jquery',
  'backbone'
], ($, Backbone) ->

  class TimerInputModel extends Backbone.Model

    defaults: {
      hours: '00'
      minutes: '00'
      seconds: '00'
    }
