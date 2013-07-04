define [
  "jquery",
  "underscore",
  "backbone",
  "moment",
  "countdown_timer"
], ($, _, Backbone, moment, CountdownTimer) ->

  class AppRouter extends Backbone.Router

    routes: ->
      "": "clock"

    clock: ->
      countdownTimer = new CountdownTimer(5)

      $('button').on('click', ->
        countdownTimer.start()
      )


      # timerMoment = moment([0, 0, 0, 0, 0, 4, 0])


      # stopTimer = (intervalHandler) ->
      #   clearInterval(intervalHandler)

      # saveTime = ->
      #   timerMoment = moment([0, 0, 0, 0, 0, 10, 0])

      # clickStart = ->
      #   saveTime()
      #   intervalHandler = setInterval(refresh, 1000)
      #   setTimeout(->
      #     stopTimer(intervalHandler)
      #   , 5000)



  initialize: ->
    app_router = new AppRouter()