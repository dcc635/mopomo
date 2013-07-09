define [
  'jquery',
  'moment'
], ($, moment) ->

  REFRESH_MS = 70

  class CountdownTimer

    constructor: (@start_ms) ->
      @reset()

    padLeftZeros: (number, padding) ->
      numberStr = '' + number
      while numberStr.length < padding
        numberStr = '0' + numberStr
      return numberStr

    displayMoment: ->
      hours = @padLeftZeros(@duration.hours(), 2)
      minutes = @padLeftZeros(@duration.minutes(), 2)
      seconds = @padLeftZeros(@duration.seconds(), 2)
      milliseconds = @padLeftZeros(Math.floor(@duration.milliseconds()/10), 2)
      timestamp = "#{hours}:#{minutes}:#{seconds}:#{milliseconds}"
      $('.clock').html(timestamp)

    getElapsed: ->
      moment_now = moment()
      elapsed = @moment_last.diff(moment_now)
      @moment_last = moment_now
      return elapsed

    refresh: =>
      @duration.add(@getElapsed(), 'ms')
      if @duration.asMilliseconds() <= 0
        @duration = moment.duration(0)
        @stop()
      else
        @interval = setTimeout(@refresh, REFRESH_MS)
      @displayMoment()

    stop: =>
      if @interval
        clearTimeout(@interval)

    start: =>
      @stop()
      @moment_last = moment()
      @interval = setTimeout(@refresh, REFRESH_MS)

    reset: (ms=@start_ms) ->
      @stop()
      @start_ms = ms
      @duration = moment.duration(ms)
      @displayMoment()