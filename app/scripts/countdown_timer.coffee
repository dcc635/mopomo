define [
  'jquery',
  'moment'
], ($, moment) ->

  REFRESH_MS = 70

  class CountdownTimer

    to_secs: (mils) ->
      return mils * 1000

    constructor: (ms) ->
      @start_ms = ms
      @moment = moment(ms)
      @moment.hours(0)
      @moment.days(1)

    display_moment: ->
      timestamp = @moment.format("HH:mm:ss:SS")
      $('.clock').html(timestamp)

    getElapsed: ->
      moment_now = moment()
      elapsed = @moment_last.diff(moment_now)
      @moment_last = moment_now
      return elapsed

    refresh: =>
      @moment.add('ms', @getElapsed())
      if (
        @moment.days() == 1 and
        @moment.hours() == 0 and
        @moment.minutes() == 0 and
        @moment.seconds() == 0 and
        @moment.milliseconds() <= REFRESH_MS
      )
        @moment = moment([0,0,0,0,0,0,0])
        @display_moment()
        @stop()
      else
        @display_moment()
        @interval = setTimeout(@refresh, REFRESH_MS)

    stop: =>
      if @interval
        clearTimeout(@interval)

    start: =>
      @stop()
      @moment_last = moment()
      @interval = setTimeout(@refresh, REFRESH_MS)

    setTime: (ms) ->
      @moment.milliseconds(ms)

    reset: ->
      @stop()
      @moment = moment(@start_ms)
      @moment.hours(0)
      @moment.days(1)
      @display_moment()