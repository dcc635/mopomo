define [
  'collections/timers'
] (TimersCollection) ->

  class TimersView extends Backbone.View

    initialize: (@timerCollection) ->
