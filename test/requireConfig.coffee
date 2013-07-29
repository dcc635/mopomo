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

    modernizr:
      exports: 'Modernizr'

    sinon:
      exports: 'sinon'

    sinonStub:
      deps: ['sinon']
      exports: 'stub'

    sinonSpy:
      deps: ['sinon']
      exports: 'spy'

  paths:
    backbone: "../../app/bower_components/backbone-amd/backbone-min"
    blanket: "../../app/bower_components/blanket/dist/qunit/blanket.min"
    bootstrap: "vendor/bootstrap"
    chai: "../../app/bower_components/chai/chai"
    handlebars: "../../app/bower_components/require-handlebars-plugin/Handlebars"
    hbs: "../../app/bower_components/require-handlebars-plugin/hbs"
    i18nprecompile: "../../app/bower_components/require-handlebars-plugin/hbs/i18nprecompile"
    jquery: "../../app/bower_components/jquery/jquery.min"
    json2: "../../app/bower_components/require-handlebars-plugin/hbs/json2"
    modernizr: "../../app/bower_components/modernizr/modernizr"
    moment: "../../app/bower_components/moment/min/moment.min"
    sinon: "../../app/bower_components/sinon/lib/sinon"
    sinonStub: "../../app/bower_components/sinon/lib/sinon/stub"
    sinonSpy: "../../app/bower_components/sinon/lib/sinon/spy"
    squire: "../../app/bower_components/squire/src/Squire"
    underscore: "../../app/bower_components/underscore-amd/underscore-min"

  baseUrl: '../.tmp/scripts'
