 define (require) ->

  $ = require('jquery')
  Backbone = require('backbone')
  TastypieCollection = require('collections/tastypiecollection')
  TimerModel = require('models/timer')


  class Timers extends Backbone.Collection

    url: 'http://artemis.vm:3000/api/v1/timer/'
    model: TimerModel
