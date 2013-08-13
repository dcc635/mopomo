define [
  'jquery',
  'backbone',
  'util',
  'hbs!template/timerOutput',
  'hbs!template/tally'
], ($, Backbone, Util, TimerOutputTemplate, TallyTemplate) ->

  class TimerOutputView extends Backbone.View

    initialize: ->
      @listenTo(@model, "change", @render)

    render: ->
      this.$el.html(TimerOutputTemplate({
        hours: Util.padLeftZeros(@model.attributes.hours, 2)
        minutes: Util.padLeftZeros(@model.attributes.minutes, 2)
        seconds: Util.padLeftZeros(@model.attributes.seconds, 2)
      }))
      milliseconds = @model.attributes.milliseconds
      amp = 100
      sin_position = 100 - 100 * Math.abs(Math.sin(milliseconds * Math.PI / 1000))
      position = 13 + (0.59 * sin_position)
      $('div #millisecond-animation').css({
        'top': "#{ position }%"
      })
      $('div #tally').html(TallyTemplate({
        tally: @model.attributes.tally
      }))
      return this
