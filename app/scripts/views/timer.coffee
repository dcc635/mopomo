define (require) ->

  $ = require('jquery')
  Backbone = require('backbone')
  Util = require('util')
  # TimerInputTemplate = require('hbs!template/timerInput')
  # TimerOutputTemplate = require('hbs!template/timerOutput')
  TimerTemplate = require('hbs!template/timer')
  # TallyTemplate = require('hbs!template/tally')

  class TimerView extends Backbone.View

    initialize: (@timerModel) ->
      @listenTo(@timerModel, "change:paused", @renderInput)
      @listenTo(@timerModel.get('currentTime'), "change", @renderOutput)
      @renderInput()
      @renderOutput()
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
      @timerModel.get('startTime').set(
        hours: $('#hours').val()
        minutes: $('#minutes').val()
        seconds: $('#seconds').val()
        milliseconds: 0
      )
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

    renderInput: ->
      console.log(@timerModel.get('paused'))
      if @timerModel.get('paused')
        $('button#start-pause').html('Start')
      else
        $('button#start-pause').html('Pause')
      return this

    renderOutput: ->
      @$el.html(TimerTemplate({
        hours: Util.padLeftZeros(@timerModel.get('currentTime').get('hours'), 2)
        minutes: Util.padLeftZeros(@timerModel.get('currentTime').get('minutes'), 2)
        seconds: Util.padLeftZeros(@timerModel.get('currentTime').get('seconds'), 2)
        tally: @timerModel.get('tally')
      }))
      milliseconds = @timerModel.get('currentTime').get('milliseconds')
      amp = 100
      sin_position = 100 - 100 * Math.abs(Math.sin(milliseconds * Math.PI / 1000))
      position = 13 + (0.59 * sin_position)
      $('div #millisecond-animation').css({
        'top': "#{ position }%"
      })
      return this

    render: ->
      @renderInput()
      @renderOutput()