define (require) ->

  $ = require('jquery')
  _ = require('underscore')
  Backbone = require('backbone')
  TimerModel = require('models/timer')
  TimerView = require('views/timer')

  class AppRouter extends Backbone.Router

    initialize: ->
      @timerModel = new TimerModel()
      @timerView = new TimerView(@timerModel)

    routes: ->
      '': 'timer'

    timer: ->
      $('#timers').html(@timerView.render().el)
      # $('#output-text').html(@timerView.renderOutput().el)


  initialize: ->
    appRouter = new AppRouter()
