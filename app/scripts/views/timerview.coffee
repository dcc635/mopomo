define [
  'jquery',
  'backbone',
  'hbs!template/timer'
], ($, Backbone, TimerTemplate) ->

  class TimerView extends Backbone.View

    initialize: ->
      @listenTo(@model, "change", @render)

    render: ->
      this.$el.html(TimerTemplate(@model.attributes))
      this.delegateEvents({
        'click button#start': '@model.start'
      })
      this.delegateEvents({
        'click button#reset': '@model.reset'
      })
