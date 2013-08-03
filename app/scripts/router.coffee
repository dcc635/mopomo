define [
  'jquery',
  'underscore',
  'backbone',
  'moment',
  'models/timer'
  'models/timerInput'
  'views/timerInput'
  'views/timerOutput'
], ($, _, Backbone, moment, TimerModel, TimerInputModel, TimerInputView, TimerOutputView) ->

  class AppRouter extends Backbone.Router

    initialize: ->
      @timerInputModel = new TimerInputModel()
      @timerModel = new TimerModel()
      @timerInputView = new TimerInputView(@timerInputModel, @timerModel)
      @timerOutputView = new TimerOutputView({model: @timerModel})

    routes: ->
      '': 'timer'

    timer: ->
      $('#timer-input').html(@timerInputView.render().el);
      $('#output-text').html(@timerOutputView.render().el);

  initialize: ->
    appRouter = new AppRouter()