 define (require) ->

  $ = require('jquery')
  Backbone = require('backbone')
  TimerModel = require('models/timer')


  class Timers extends Backbone.Collection

    url: 'http://localhost:3000/api/v1/timer/'
    model: TimerModel

    parse: (response) ->
      return response.objects
