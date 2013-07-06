define [
  'jquery',
  'underscore',
  'backbone',
  'moment',
  'countdown_timer'
], ($, _, Backbone, moment, CountdownTimer) ->

  class AppRouter extends Backbone.Router

    routes: ->
      "": "clock"

    clock: ->
      countdownTimer = new CountdownTimer(5, 'seconds')



      $('button').on('click', ->
        countdownTimer.start()
      )

  initialize: ->
    app_router = new AppRouter()
