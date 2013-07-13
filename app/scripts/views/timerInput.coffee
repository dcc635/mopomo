define [
  'jquery',
  'backbone',
  'hbs!template/timerInput'
], ($, Backbone, TimerInputTemplate) ->

  class TimerInputView extends Backbone.View

    start: ->
      @reset()
      @model.start()

    reset: ->
      @model.set({
        hours: 0
        minutes: 0
        seconds: 7
        milliseconds: 0
      })
      @model.reset()

    render: ->
      this.$el.html(TimerInputTemplate())
      @delegateEvents({
        'click button#start': 'start'
        'click button#reset': 'reset'
      })
      return this