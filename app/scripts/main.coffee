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
      x = moment().format('h:mm:ss')
      console.log(moment().format())
      $('#clock').html(x)

  AppRouter = Backbone.Router.extend

    routes:
      "": "clock"

    clock: setInterval(refresh, 1000)

  app = new AppRouter()

  Backbone.history.start()
