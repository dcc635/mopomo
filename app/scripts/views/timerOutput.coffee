define [
  'jquery',
  'backbone',
  'util',
  'hbs!template/timerOutput'
], ($, Backbone, Util, TimerOutputTemplate) ->

  class TimerOutputView extends Backbone.View

    initialize: ->
      @listenTo(@model, "change", @render)

    render: ->
      this.$el.html(TimerOutputTemplate({
        hours: Util.padLeftZeros(@model.attributes.hours, 2)
        minutes: Util.padLeftZeros(@model.attributes.minutes, 2)
        seconds: Util.padLeftZeros(@model.attributes.seconds, 2)
        milliseconds: Util.padLeftZeros(Math.floor(@model.attributes.milliseconds/10), 2)
      }));
      return this