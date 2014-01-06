 define (require) ->

  $ = require('jquery')
  Backbone = require('backbone')
  TimerModel = require('models/timer')

  proxiedSync = Backbone.sync;
  Backbone.sync = (method, model, options) ->
    options || (options = {})

    if (!options.crossDomain) 
      options.crossDomain = true;

    if (!options.xhrFields)
      options.xhrFields = {withCredentials:true};

    return proxiedSync(method, model, options);

  class Timers extends Backbone.Collection

    url: 'http://artemis.vm:3000/api/v1/timer/?format=json'
    model: TimerModel
