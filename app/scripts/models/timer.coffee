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
    }

    initialize: (@refreshMs = 70) =>
      @reset()

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

    refresh: =>
      elapsed = @getElapsed()
      console.log("milliseconds before: #{ @duration.asMilliseconds() }")
      @duration = @duration.subtract(elapsed, 'ms')
      console.log("milliseconds after: #{ @duration.asMilliseconds() }")
      if @duration.asMilliseconds() > 0
        @interval = setTimeout(@refresh, @refreshMs)
      else
        @duration = Moment.duration(0)
        @stop()
        audioElement = document.createElement('audio')
        audioElement.setAttribute('src', 'http://cd.textfiles.com/10000soundssongs/WAV/DING1.WAV')
        audioElement.setAttribute('autoplay', 'autoplay')
        $.get()
        audioElement.addEventListener("load", ->
          audioElement.play()
        , true)
      @saveDuration()

    stop: =>
      if @interval
        clearTimeout(@interval)

    start: =>
      @stop()
      @momentLast = Moment()
      @interval = setTimeout(@refresh, @refreshMs)

    reset: ->
      @stop()
      @duration = Moment.duration(@attributes)
      @saveDuration()