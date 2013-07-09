define [
  'jquery',
  'backbone',
  'hbs!template/timer'
], ($, Backbone, Timer) ->

  class TimerView extends Backbone.View

    initialize: ->
      @listenTo(@model, "change", @render)

    render: ->
      $('#app').html(Timer(@model.attributes))