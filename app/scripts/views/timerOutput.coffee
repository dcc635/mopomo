define [
  'jquery',
  'backbone',
  'hbs!template/timerOutput'
], ($, Backbone, TimerOutputTemplate) ->

  class TimerOutputView extends Backbone.View

    initialize: ->
      @listenTo(@model, "change", @render)

    padLeftZeros: (number, padding) ->
      numberStr = '' + number
      while numberStr.length < padding
        numberStr = '0' + numberStr
      return numberStr

    render: ->
      this.$el.html(TimerOutputTemplate({
        hours: @padLeftZeros(@model.attributes.hours, 2)
        minutes: @padLeftZeros(@model.attributes.minutes, 2)
        seconds: @padLeftZeros(@model.attributes.seconds, 2)
        milliseconds: @padLeftZeros(Math.floor(@model.attributes.milliseconds/10), 2)
      }));
      return this