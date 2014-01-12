define (require) ->

  $ = require('jquery')
  _ = require('underscore')
  Backbone = require('backbone')
  TimerModel = require('models/timer')
  Timers = require('collections/timers')
  TimerView = require('views/timer')
  TimersView = require('views/timers')


  class AppRouter extends Backbone.Router

    initialize: ->
      @timers = new Timers()
      @timers.fetch
        reset: true
        success: =>
          console.log(@timers)
          @timersView = new TimersView(collection: @timers)
          @timer()

    routes: ->
      '': 'timer'

    timer: ->
      if @timersView
        $('#timers').html(@timersView.render().el)


  initialize: ->
    appRouter = new AppRouter()
