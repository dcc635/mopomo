define [
  'jquery',
  'underscore',
  'backbone',
  'moment',
  'models/timermodel'
  'views/timerview'
], ($, _, Backbone, moment, TimerModel, TimerView) ->

  class AppRouter extends Backbone.Router
    initialize: ->
      @timerModel = new TimerModel(5000)
      @timerView = new TimerView({model: @timerModel})

    routes: ->
      '': 'timer'

    timer: ->
      @timerView.render();
      $('button#start').on('click', =>
        @timerView.start()
      )
      $('button#reset').on('click', =>
        @timerView.reset()
      )

  initialize: ->
    appRouter = new AppRouter()