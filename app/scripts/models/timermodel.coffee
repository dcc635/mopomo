define [
  'jquery',
  'backbone',
  'moment'
], ($, Backbone) ->

  class TimerModel extends Backbone.Model
    REFRESH_MS = 70

    defaults: {
      hours: 0
      minutes: 0
      seconds: 0
      milliseconds: 0
    }

    initialize: (@start_ms) =>
      @reset()

    getElapsed: ->
      moment_now = moment()
      elapsed = @moment_last.diff(moment_now)
      @moment_last = moment_now
      return elapsed

    save_duration: ->
      @set({
        hours: @duration.hours()
        minutes: @duration.minutes()
        seconds: @duration.seconds()
        milliseconds: @duration.milliseconds()
      })

    refresh: =>
      elapsed = @getElapsed()
      @duration = @duration.add(elapsed, 'ms')
      if @duration.asMilliseconds() <= 0
        @duration = moment.duration(0)
        @stop()
      else
        @interval = setTimeout(@refresh, REFRESH_MS)
      @save_duration()

    stop: =>
      if @interval
        clearTimeout(@interval)

    start: =>
      @stop()
      @moment_last = moment()
      @interval = setTimeout(@refresh, REFRESH_MS)

    reset: (ms=@start_ms) ->
      @stop()
      @duration = moment.duration(ms)
      @save_duration()