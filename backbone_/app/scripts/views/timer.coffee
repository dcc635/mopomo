define (require) ->

  $ = require('jquery')
  Backbone = require('backbone')
  TimerTemplate = require('hbs!template/timer')
  TimerInputView = require('views/timer/input')
  TimerOutputView = require('views/timer/output')
  TimerTallyView = require('views/timer/tally')


  class TimerView extends Backbone.View

    initialize: ->
      @render()
  
    render: ->
      @$el.html(TimerTemplate())
      @input = new TimerInputView(el: @$(".timer-input"), model: @model)
      @output = new TimerOutputView(el: @$(".timer-output"), model: @model)
      @tally = new TimerTallyView(el: @$(".timer-tally"), model: @model)
      @input.render()
      @output.render()
      @tally.render()
      return this
