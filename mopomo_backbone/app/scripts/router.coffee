define (require) ->

  $ = require('jquery')
  _ = require('underscore')
  Backbone = require('backbone')
  TimerModel = require('models/timer')
  TimerView = require('views/timer')
  SignInView = require('views/signin')


  class AppRouter extends Backbone.Router

    initialize: ->
      @timerModel = new TimerModel()
      @timerView = new TimerView(model: @timerModel)
      @signInView = new SignInView()

    routes: ->
      '': 'timer'

    timer: ->
      $('#timers').html(@timerView.render().el)
      $('#signin').html(@signInView.render().el)


  initialize: ->
    appRouter = new AppRouter()
