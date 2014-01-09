  define (require) ->

  $ = require('jquery')
  Backbone = require('backbone')

  class TastypieCollection extends Backbone.Collection

    parse: (response) ->
      @recent_meta = response.meta || {}
      return response.objects || response