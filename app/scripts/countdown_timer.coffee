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


    display_moment: ->
        timestamp = @moment.format("HH:mm:ss:SS")
        $('.clock').html(timestamp)

    refresh: =>
      if (
        @moment.hours() == 0 and
        @moment.minutes() == 0 and
        @moment.seconds() == 0 and
        @moment.milliseconds() <= REFRESH_MS * 2
      )
        console.log('stop!')
        @moment = moment([0,0,0,0,0,0,0])
        @display_moment()
        @stop()
      else
        new_moment = moment()
        elapsed_ms = @old_moment.diff(new_moment)
        @moment.add('ms', elapsed_ms)
        @display_moment()
        @old_moment = new_moment
        @interval = setTimeout(@refresh, REFRESH_MS)

    stop: =>
      if @interval
        clearTimeout(@interval)

    start: =>
      @stop()
      @old_moment = moment()
      @interval = setTimeout(@refresh, REFRESH_MS)

    setTime: (ms) ->
      @moment.milliseconds(ms)

    reset: ->
      @stop()
      @moment = moment(@start_ms)
      @moment.hours(0)
      @display_moment()