define [
  'jquery',
  'underscore',
  'backbone',
  'router',
], ($, _, Backbone, Router) ->

  initialize = ->
    Router.initialize()
    Backbone.history.start()

  return {
    initialize: initialize
  }