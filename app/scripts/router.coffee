define (require) ->
  
  $ = require('jquery')
  _ = require('underscore')
  Backbone = require('backbone')
  TimerModel = require('models/timer')
  TimerInputView = require('views/timerInput')
  TimerOutputView = require('views/timerOutput')

  class AppRouter extends Backbone.Router

    initialize: ->
      @timerModel = new TimerModel()
      @timerInputView = new TimerInputView(@timerModel)
      @timerOutputView = new TimerOutputView({model: @timerModel})

    routes: ->
      '': 'timer'

    timer: ->
      $('#timer-input').html(@timerInputView.render().el);
      $('#output-text').html(@timerOutputView.render().el);

  initialize: ->
    appRouter = new AppRouter()