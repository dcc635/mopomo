define [
  'jquery',
  'backbone',
  'util',
  'hbs!template/timerInput'
], ($, Backbone, Util, TimerInputTemplate) ->

  class TimerInputView extends Backbone.View

    initialize: (@timerInputModel, @timerModel) ->

    start: ->
      if window.webkitNotifications.checkPermission() is not 0
        window.webkitNotifications.requestPermission()
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
      for id in ['#hours', '#minutes', '#seconds']
        $(id).val(Util.padLeftZeros($(id).val(), 2))

    allow_only_numerals: ->
      for id in ['#hours', '#minutes', '#seconds']
        if (/\D/g.test($(id).val()))
          $(id).val($(id).val().replace(/\D/g, ''))

    focus: ->
      $(this.select())

    render: ->
      this.$el.html(TimerInputTemplate(@timerInputModel.attributes))
      @delegateEvents({
        'click button#start': 'start'
        'click button#reset': 'resetOutput'
        'keyup input': 'allow_only_numerals'
        'focusout input': 'format'
      })
      return this
