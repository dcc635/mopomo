define [
  'jquery',
  'backbone',
  'util',
  'hbs!template/timerInput'
], ($, Backbone, Util, TimerInputTemplate) ->

  class TimerInputView extends Backbone.View

    initialize: (@timerInputModel, @timerModel) ->

    start: ->
      @resetOutput()
      @timerModel.start()

    resetOutput: ->
      @timerModel.set({
        hours: $('#hours').val()
        minutes: $('#minutes').val()
        seconds: $('#seconds').val()
        milliseconds: 0
      })
      @timerModel.reset()

    format: ->
      # console.log($('#hours').val())
      # @timerInputModel.set({
      #   hours: Util.padLeftZeros($('#hours').val(), 2)
      #   minutes: Util.padLeftZeros($('#minutes').val(), 2)
      #   seconds: Util.padLeftZeros($('#seconds').val(), 2)
      # })
      $('#hours').val(Util.padLeftZeros($('#hours').val(), 2))
      $('#minutes').val(Util.padLeftZeros($('#minutes').val(), 2))
      $('#seconds').val(Util.padLeftZeros($('#seconds').val(), 2))

    render: ->
      this.$el.html(TimerInputTemplate(@timerInputModel.attributes))
      @delegateEvents({
        'click button#start': 'start'
        'click button#reset': 'resetOutput'
        'focusout input': 'format'
      })
      return this
