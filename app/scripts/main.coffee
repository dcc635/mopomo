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
  m = moment([0, 0, 0, 23, 59, 50, 0])

  refresh = ->
    m.add('seconds', 1)
    timestamp = m.format('HH:mm:ss')
    $('.clock').html(timestamp)


  class AppRouter extends Backbone.Router

    routes: ->
      "": "clock"

    clock: ->
      setInterval(refresh, 1000)

  app = new AppRouter()

  Backbone.history.start()