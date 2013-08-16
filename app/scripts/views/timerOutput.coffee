define (require) ->

  $ = require('jquery')
  Backbone = require('backbone')
  Util = require('util')
  TimerOutputTemplate = require('hbs!template/timerOutput')
  TallyTemplate = require('hbs!template/tally')


  class TimerOutputView extends Backbone.View

    initialize: ->
      @listenTo(@model.get('currentTime'), "change", @render)

    render: ->
      @$el.html(TimerOutputTemplate({
        hours: Util.padLeftZeros(@model.get('currentTime').get('hours'), 2)
        minutes: Util.padLeftZeros(@model.get('currentTime').get('minutes'), 2)
        seconds: Util.padLeftZeros(@model.get('currentTime').get('seconds'), 2)
      }))
      milliseconds = @model.get('currentTime').get('milliseconds')
      amp = 100
      sin_position = 100 - 100 * Math.abs(Math.sin(milliseconds * Math.PI / 1000))
      position = 13 + (0.59 * sin_position)
      $('div #millisecond-animation').css({
        'top': "#{ position }%"
      })
      $('div #tally').html(TallyTemplate({
        tally: @model.get('tally')
      }))
      return this
