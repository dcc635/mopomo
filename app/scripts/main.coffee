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
  refresh = ->
      x = moment().format('h:mm:ss a')
      console.log(moment().format())
      $('#clock').html(x)

  class AppRouter extends Backbone.Router

    routes: ->
      "": "clock"

    clock: ->
      setInterval(refresh, 5)

  app = new AppRouter()

  Backbone.history.start()