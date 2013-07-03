define [
  "jquery",
  "underscore",
  "backbone",
  "moment"
], ($, _, Backbone, moment) ->

  class AppRouter extends Backbone.Router

    routes: ->
      "": "clock"

    clock: ->

      timerMoment = moment([0, 0, 0, 0, 0, 4, 0])

      refresh = ->
        timerMoment.subtract('seconds', 1)
        timestamp = timerMoment.format('HH:mm:ss')
        $('.clock').html(timestamp)

      stopTimer = (intervalHandler) ->
        clearInterval(intervalHandler)

      saveTime = ->
        timerMoment = moment([0, 0, 0, 0, 0, 10, 0])

      clickStart = ->
        saveTime()
        intervalHandler = setInterval(refresh, 1000)
        setTimeout(->
          stopTimer(intervalHandler)
        , 5000)

      $('button').on('click', ->
        clickStart()
      )

  initialize: ->
    app_router = new AppRouter()
    Backbone.history.start()