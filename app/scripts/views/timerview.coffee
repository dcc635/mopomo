define [
  'jquery',
  'backbone',
  'hbs!template/timer'
], ($, Backbone, TimerTemplate) ->

  class TimerView extends Backbone.View

    initialize: ->
      @listenTo(@model, "change", @render)

    padLeftZeros: (number, padding) ->
      numberStr = '' + number
      while numberStr.length < padding
        numberStr = '0' + numberStr
      return numberStr

    start: ->
      @model.start()

    reset: ->
      @model.reset()

    render: ->
      $('#app').html(TimerTemplate({
        hours: @padLeftZeros(@model.attributes.hours, 2)
        minutes: @padLeftZeros(@model.attributes.minutes, 2)
        seconds: @padLeftZeros(@model.attributes.seconds, 2)
        milliseconds: @padLeftZeros(Math.floor(@model.attributes.milliseconds/10), 2)
      }));