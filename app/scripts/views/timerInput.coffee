define [
  'jquery',
  'backbone',
  'hbs!template/timerInput'
], ($, Backbone, TimerInputTemplate) ->

  class TimerInputView extends Backbone.View

    start: ->
      @model.start()

    reset: ->
      @model.reset()

    render: ->
      console.log(TimerInputTemplate())
      this.$el.html(TimerInputTemplate())
      @delegateEvents({
        'click button#start': 'start'
        'click button#reset': 'reset'
      })
      return this