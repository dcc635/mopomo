define (require) ->

  $ = require('jquery')
  _ = require('underscore')
  Backbone = require('backbone')
  TimerModel = require('models/timer')
  Timers = require('collections/timers')
  TimerView = require('views/timer')


  class AppRouter extends Backbone.Router

    initialize: ->
      @timers = new Timers()
      @timers.fetch()
      @timerModel = new TimerModel()
      @timerView = new TimerView(model: @timerModel)

    routes: ->
      '': 'timer'

    timer: ->
      $('#timers').html(@timerView.render().el)


  initialize: ->
    appRouter = new AppRouter()
