define [
  'jquery',
  'underscore',
  'backbone',
  'moment',
  'models/timer'
  'views/timerInput'
  'views/timerOutput'
], ($, _, Backbone, moment, TimerModel, TimerInputView, TimerOutputView) ->

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