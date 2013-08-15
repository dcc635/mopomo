define [
  'jquery',
  'underscore',
  'backbone',
  'moment',
  'models/timer',
  'models/timerInput',
  'views/timerInput',
  'views/timerOutput',
  'views/timers',
], (
  $,
  _,
  Backbone,
  moment,
  TimerModel,
  TimerInputModel,
  TimerInputView,
  TimerOutputView,
  TimersView,
) ->

  class AppRouter extends Backbone.Router

    initialize: ->
      # @timerInputModel = new TimerInputModel()
      #@timerModel = new TimerModel()
      # @timerInputView = new TimerInputView(@timerInputModel, @timerModel)
      # @timerOutputView = new TimerOutputView({model: @timerModel})
      @timersView = new TimersView()

    routes: ->
      '': 'timer'

    timer: ->
      $('#timers').html(@timersView.render().el);
      # $('#timer-input').html(@timerInputView.render().el);
      # $('#output-text').html(@timerOutputView.render().el);

  initialize: ->
    appRouter = new AppRouter()