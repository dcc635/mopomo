define (require) ->

  $ = require('jquery')
  Backbone = require('backbone')
  TimerInputTemplate = require('hbs!template/timer/input')
  TimerModel = require('models/timer')
  Formatting = require('formatting')


  class TimerInputView extends Backbone.View

    initialize: ->
      @listenTo(@model, "change:paused", @render)
      @$el.html(TimerInputTemplate(@model.get('startTime')))
      @tagId = "#timer-#{@model.id}"
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
        hours: $('.hours').val()
        minutes: $('.minutes').val()
        seconds: $('.seconds').val()
        milliseconds: 0
      @model.reset()

    format: ->
      for unitClass in ['.hours', '.minutes', '.seconds']
        unitTag = "#{@tagId} #{unitClass}"
        $(unitTag).val(Formatting.padLeftZeros($(unitTag).val(), 2))

    allow_only_numerals: ->
      for unitClass in ['.hours', '.minutes', '.seconds']
        unitTag = "#{@tagId} #{unitClass}"
        if (/\D/g.test($(unitTag).val()))
          $(unitTag).val($(unitTag).val().replace(/\D/g, ''))

    focus: ->
      $(@select())

    render: ->
      if @model.get('paused')
        $("#{@tagId} button.start-pause").html('Start')
      else
        $("#{@tagId} button.start-pause").html('Pause')
      return this
