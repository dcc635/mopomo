define [
  'jquery',
], ($) ->

  class CountdownTimer

    to_secs: (mils) ->
      return mils * 1000

    reset: ->
      @start_seconds = @seconds
      console.log("reset seconds: #{@seconds}")
      console.log("reset start_seconds: #{@start_seconds}")

    constructor: (@seconds) ->
      console.log("Constructor seconds: #{@seconds}")
      @reset()

    format_seconds: (seconds) ->
      hours = Math.floor(seconds/(60 * 60))
      minutes = Math.floor((seconds % 60) / 60)
      seconds = Math.floor((seconds % 60) % 60)
      return "#{hours}:#{minutes}:#{@seconds}"

    refresh: =>
      console.log("Current time: #{@seconds}")
      @seconds--
      timestamp = @format_seconds(@seconds)
      $('.clock').html(timestamp)

    stop: =>
      clearInterval(@interval)

    start: =>
      console.log("start seconds: #{@seconds}")
      console.log("start start_seconds: #{@start_seconds}")
      @interval = setInterval(@refresh, @to_secs(1))
      setTimeout(@stop, @to_secs(@start_seconds))

    setTime: (seconds) ->
      @seconds = seconds
