define [
  'jquery',
  'backbone',
  'moment'
], ($, Backbone, Moment) ->

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
      if @duration.asMilliseconds() <= 0
        @duration = Moment.duration(0)
        @stop()
      else
        @interval = setTimeout(@refresh, REFRESH_MS)
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