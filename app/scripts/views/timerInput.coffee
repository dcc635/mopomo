define [
  'jquery',
  'backbone',
  'util',
  'hbs!template/timerInput',
  'modernizr'
], ($, Backbone, Util, TimerInputTemplate, Modernizr) ->

  class TimerInputView extends Backbone.View

    initialize: (@timerModel) ->
      @listenTo(@timerModel, "change:paused", @render)
      this.$el.html(TimerInputTemplate(@timerModel.get('start')))
      @timerModel.audioElement.pause()
      @delegateEvents({
        'click button#start-pause': 'startPause'
        'click button#reset': 'reset'
        'keyup input': 'allow_only_numerals'
        'focusout input': 'format'
      })

    startPause: ->
      if @timerModel.get('paused')
        if @timerModel.get('completed')
          @reset()
        @timerModel.start()
      else
        @timerModel.pause()

    reset: ->
      @timerModel.set({
        start: {
          hours: $('#hours').val()
          minutes: $('#minutes').val()
          seconds: $('#seconds').val()
          milliseconds: 0
        }
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
      if @timerModel.get('paused')
        $('button#start-pause').html('Start')
      else
        $('button#start-pause').html('Pause')
      return this
