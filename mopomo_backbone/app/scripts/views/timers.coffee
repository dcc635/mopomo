define (require) ->

  $ = require('jquery')
  Backbone = require('backbone')
  TimersTemplate = require('hbs!template/timers')


  class TimersView extends Backbone.View

    initialize: ->
      @listenTo(@collection, "reset", @render)

    render: ->
      debugger
      @$el.html(TimersTemplate(@collection))
      return this