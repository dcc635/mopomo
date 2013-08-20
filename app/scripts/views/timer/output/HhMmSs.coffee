define (require) ->

  $ = require('jquery')
  Backbone = require('backbone')
  Util = require('util')
  TimerOutputHhMmSsTemplate = require('hbs!template/timer/output/HhMmSs')


  class TimerOutputHhMmSsView extends Backbone.View

    initialize: ->
      @listenTo(@model, "change:currentTime", @render)

    render: ->
      @$el.html TimerOutputHhMmSsTemplate
        hours: Util.padLeftZeros(@model.get('currentTime').get('hours'), 2)
        minutes: Util.padLeftZeros(@model.get('currentTime').get('minutes'), 2)
        seconds: Util.padLeftZeros(@model.get('currentTime').get('seconds'), 2)
      return this
