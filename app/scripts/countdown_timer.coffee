define [
  'jquery',
], ($) ->

  class CountdownTimer

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
      @interval = setInterval(@refresh, 1000)
      setTimeout(@stop, 5000)


    setTime: (seconds) ->
      @seconds = seconds
