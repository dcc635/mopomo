define [
  'jquery',
  'backbone',
  'hbs!template/timer'
], ($, Backbone, TimerTemplate) ->

  class TimerView extends Backbone.View

    initialize: ->
      @listenTo(@model, "change", @render)

    start: ->
      @model.start()

    reset: ->
      @model.reset()

    render: ->
      $('#app').html(TimerTemplate(@model.attributes));