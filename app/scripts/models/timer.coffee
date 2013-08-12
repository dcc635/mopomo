define [
  'jquery',
  'backbone',
  'moment',
  'modernizr'
], ($, Backbone, Moment, Modernizr) ->

  class TimerModel extends Backbone.Model

    defaults: {
      hours: 0
      minutes: 0
      seconds: 0
      milliseconds: 0
      tally: 0
    }

    initialize: (@refreshMs = 70) =>
      @audioElement = document.createElement('audio')
      @audioElement.setAttribute('src', 'http://cd.textfiles.com/10000soundssongs/WAV/DING1.WAV')
      @reset()

    playSound: () ->
      @audioElement.play()

    getElapsed: (momentLast = @momentLast, momentNow = Moment()) ->
      if not momentLast
        return 0
      elapsed = momentNow.diff(momentLast)
      @momentLast = momentNow
      return elapsed

    saveDuration: ->
      @set({
        hours: Math.floor(@duration.asHours())
        minutes: @duration.minutes()
        seconds: @duration.seconds()
        milliseconds: @duration.milliseconds()
      })

    continueTimer: =>
      @interval = setTimeout(@refresh, @refreshMs)

    refresh: =>
      elapsed = @getElapsed()
      @duration = @duration.subtract(elapsed, 'ms')
      if @duration.asMilliseconds() > 0
        @continueTimer()
      else
        @completePomodoro()
      @saveDuration()

    pause: =>
      if @interval
        clearTimeout(@interval)

    completePomodoro: ->
      @duration = Moment.duration(0)
      @pause()
      @playSound()
      @set('tally', @get('tally') + 1)

    start: =>
      @pause()
      @momentLast = Moment()
      @interval = setTimeout(@refresh, @refreshMs)

    reset: ->
      @pause()
      @duration = Moment.duration(@attributes)
      @saveDuration()