define (require) ->

  $ = require('jquery')
  Backbone = require('backbone')
  TimerInputTemplate = require('hbs!template/timer/input')
  TimerModel = require('models/timer')
  Formatting = require('formatting')


  class TimerInputView extends Backbone.View

    initialize: ->
      @listenTo(@model, "change:paused", @render)
      @tagId = "#timer-#{@model.id}"
      @$el.html(TimerInputTemplate())
      @delegateEvents
        'click button.start-pause': 'startPause'
        'click button.reset': 'reset'
        'keyup input': 'allow_only_numerals'
        'focusout input': 'format'

    startPause: ->
      if @model.get('paused')
        if @model.get('completed')
          @reset()
        @model.start()
      else
        @model.pause()

    reset: ->
      @model.set 'startTime',
        hours: $("#{@tagId} .hours").val()
        minutes: $("#{@tagId} .minutes").val()
        seconds: $("#{@tagId} .seconds").val()
        milliseconds: 0
      @model.reset()

    format: ->
      for unitClass in ['.hours', '.minutes', '.seconds']
        unitTag = "#{unitClass}"
        @$(unitClass).val(Formatting.padLeftZeros(@$(unitClass).val(), 2))

    allow_only_numerals: ->
      for unitClass in ['.hours', '.minutes', '.seconds']
        if (/\D/g.test(@$(unitClass).val()))
          @$(unitClass).val(@$(unitClass).val().replace(/\D/g, ''))

    focus: ->
      $(@select())

    render: ->
      @$('.hours').val(@model.get('startTime').hours)
      @$('.minutes').val(@model.get('startTime').minutes)
      @$('.seconds').val(@model.get('startTime').seconds)
      @format()
      if @model.get('paused')
        $("#{@tagId} button.start-pause").html('Start')
      else
        $("#{@tagId} button.start-pause").html('Pause')
      return this
