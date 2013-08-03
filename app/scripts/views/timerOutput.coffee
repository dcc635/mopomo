define [
  'jquery',
  'backbone',
  'util',
  'hbs!template/timerOutput'
], ($, Backbone, Util, TimerOutputTemplate) ->

  class TimerOutputView extends Backbone.View

    initialize: ->
      @listenTo(@model, "change", @render)
      console.log($('div #millisecond-animation'))

    render: ->
      this.$el.html(TimerOutputTemplate({
        hours: Util.padLeftZeros(@model.attributes.hours, 2)
        minutes: Util.padLeftZeros(@model.attributes.minutes, 2)
        seconds: Util.padLeftZeros(@model.attributes.seconds, 2)
      }))
      milliseconds = @model.attributes.milliseconds
      amp = 100
      position = 100-100*Math.abs(Math.sin(milliseconds*Math.PI/1000))
      $('div #millisecond-animation').css({
        'top': "#{ position }%"
      })
      return this