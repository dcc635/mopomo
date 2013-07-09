define [
  'jquery',
  'underscore',
  'backbone',
  'moment',
  'views/timer'
], ($, _, Backbone, moment, TimerView) ->

  class AppRouter extends Backbone.Router
    initialize: ->
      @timerView = new TimerView()

    routes: ->
      '': 'timer'

    timer: ->
      $('#app').html(this.timerView.render().el);

  initialize: ->
    appRouter = new AppRouter()
