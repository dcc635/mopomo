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
      @timerModel = new TimerModel()
      @timerView = new TimerView({model: @timerModel})

    routes: ->
      '': 'timer'

    timer: ->
      $('#app').html(this.timerView.render().el);

  initialize: ->
    appRouter = new AppRouter()
