define [
  'jquery',
  'backbone',
  'hbs!template/timer'
], ($, Backbone, Timer) ->

  class TimerView extends Backbone.View

    initialize: ->
      return this

    render: ->
      $('#app').html(Timer())