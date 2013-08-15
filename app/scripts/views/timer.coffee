define [
  'jquery',
  'backbone',
  'util',
  'hbs!template/timerInput',
  'hbs!template/timerOutput',
  'modernizr'
], ($, Backbone, Util, TimerInputTemplate, Modernizr) ->

  class TimerView extends Backbone.View

    initialize: (@timerInputView, @timerModel) ->
      @timerModel = new TimerModel()
      @timerInputView = new TimerInputView(@timerInputModel, @timerModel)
      @timerOutputView = new TimerOutputView({model: @timerModel})

    render: ->
      $('#timer-input').html(@timerInputView.render().el);
      $('#output-text').html(@timerOutputView.render().el);