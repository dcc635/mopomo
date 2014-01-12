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
      debugger
      @$el.html(TimerTemplate())
      timerLabel = "#timer-" + @model.get("id")
      @input = new TimerInputView(el: @$(timerLabel + " .timer-input"), model: @model)
      @output = new TimerOutputView(el: @$(timerLabel + " .timer-output"), model: @model)
      @tally = new TimerTallyView(el: @$(timerLabel + " .timer-tally"), model: @model)
      @input.render()
      @output.render()
      @tally.render()
      return this
