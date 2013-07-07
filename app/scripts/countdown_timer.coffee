define [
  'jquery',
  'moment'
], ($, moment) ->

  REFRESH_MS = 5

  class CountdownTimer

    to_secs: (mils) ->
      return mils * 1000

    constructor: (ms) ->
      @start_ms = ms
      @moment = moment(ms)
      @moment.hours(0)

    refresh: =>
      if (
        @moment.hours() == 0 and
        @moment.minutes() == 0 and
        @moment.seconds() == 0 and
        @moment.milliseconds() <= REFRESH_MS
      )
        console.log('stop!')
        @stop()
      else
        @moment.subtract('ms', REFRESH_MS)
        timestamp = @moment.format("HH:mm:ss:SS")
        $('.clock').html(timestamp)

    stop: =>
      clearInterval(@interval)

    start: =>
      @interval = setInterval(@refresh, REFRESH_MS)

    setTime: (ms) ->
      @moment.milliseconds(ms)