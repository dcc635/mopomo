#global require
"use strict"
require.config
  shim:
    underscore:
      exports: "_"

    backbone:
      deps: [
        "underscore",
        "jquery",
      ]
      exports: "Backbone"

    bootstrap:
      deps: ["jquery"]
      exports: "jquery"


  paths:
    jquery: "../bower_components/jquery/jquery"
    backbone: "../bower_components/backbone-amd/backbone"
    underscore: "../bower_components/underscore-amd/underscore"
    bootstrap: "vendor/bootstrap"
    moment: "../bower_components/moment/moment"


require ["backbone", "moment"], (Backbone, moment) ->

  class AppRouter extends Backbone.Router

    routes: ->
      "": "clock"

    clock: ->

      m = moment([0, 0, 0, 0, 0, 4, 0])

      refresh = ->
        m.subtract('seconds', 1)
        timestamp = m.format('HH:mm:ss')
        $('.clock').html(timestamp)

      stopTimer = ->
        clearInterval(intervalHandler)

      intervalHandler = setInterval(refresh, 1000)
      setTimeout(stopTimer, 5000)


  app = new AppRouter()

  Backbone.history.start()