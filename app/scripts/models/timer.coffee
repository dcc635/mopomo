define [
  'jquery',
  'backbone',
  'moment',
  'modernizr'
], ($, Backbone, Moment, Modernizr) ->

  class TimerModel extends Backbone.Model

    REFRESH_MS = 70

    defaults: {
      hours: 0
      minutes: 0
      seconds: 0
      milliseconds: 0
    }

    initialize: =>
      @reset()

    getElapsed: ->
      moment_now = Moment()
      elapsed = @moment_last.diff(moment_now)
      @moment_last = moment_now
      return elapsed

    save_duration: ->
      @set({
        hours: Math.floor(@duration.asHours())
        minutes: @duration.minutes()
        seconds: @duration.seconds()
        milliseconds: @duration.milliseconds()
      })

    refresh: =>
      elapsed = @getElapsed()
      @duration = @duration.add(elapsed, 'ms')
      if @duration.asMilliseconds() > 0
        @interval = setTimeout(@refresh, REFRESH_MS)
      else
        @duration = Moment.duration(0)
        @stop()
        audioElement = document.createElement('audio')
        audioElement.setAttribute('src', 'http://cd.textfiles.com/10000soundssongs/WAV/DING1.WAV')
        audioElement.setAttribute('autoplay', 'autoplay')
        $.get()
        audioElement.addEventListener("load", ->
          audioElement.play()
        , true);
      @save_duration()

    stop: =>
      if @interval
        clearTimeout(@interval)

    start: =>
      @stop()
      @moment_last = Moment()
      @interval = setTimeout(@refresh, REFRESH_MS)

    reset: ->
      @stop()
      @duration = Moment.duration(@attributes)
      @save_duration()