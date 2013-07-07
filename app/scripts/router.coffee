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
      countdownTimer = new CountdownTimer(5000)

      $('button#start').on('click', ->
        countdownTimer.start()
      )
      $('button#reset').on('click', ->
        countdownTimer.reset()
      )

  initialize: ->
    app_router = new AppRouter()
