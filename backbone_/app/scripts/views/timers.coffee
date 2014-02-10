define (require) ->

  $ = require('jquery')
  Backbone = require('backbone')
  TimerView = require('views/timer')
  TimersTemplate = require('hbs!template/timers')


  class TimersView extends Backbone.View

    initialize: ->
      @listenTo(@collection, "reset", @render)

    render: =>
      @$el.html(TimersTemplate(@collection))
      @collection.each (timerModel) =>
        timerView = new TimerView(el: @$("#timer-" + timerModel.get("id")), model: timerModel)
      return this