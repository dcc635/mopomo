(function() {
  "use strict";
  require.config({
    shim: {
      underscore: {
        exports: "_"
      },
      backbone: {
        deps: ["underscore", "jquery"],
        exports: "Backbone"
      },
      bootstrap: {
        deps: ["jquery"],
        exports: "jquery"
      }
    },
    paths: {
      jquery: "../bower_components/jquery/jquery",
      backbone: "../bower_components/backbone-amd/backbone",
      underscore: "../bower_components/underscore-amd/underscore",
      bootstrap: "vendor/bootstrap",
      moment: "../bower_components/moment/moment",
      hbs: "../bower_components/require-handlebars-plugin/hbs",
      handlebars: "../bower_components/require-handlebars-plugin/Handlebars",
      i18nprecompile: "../bower_components/require-handlebars-plugin/hbs/i18nprecompile",
      json2: "../bower_components/require-handlebars-plugin/hbs/json2"
    }
  });

  require(["app"], function(App) {
    return App.initialize();
  });

}).call(this);
