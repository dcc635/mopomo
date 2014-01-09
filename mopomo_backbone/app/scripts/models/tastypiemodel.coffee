 define (require) ->

  $ = require('jquery')
  Backbone = require('backbone')

  class TastypieModel extends Backbone.Model

    base_url: ->
      temp_url = Backbone.Model.prototype.url.call(this)
      return (temp_url.charAt(temp_url.length - 1) == '/' ? temp_url : temp_url + '/')

    url: ->
      return @base_url()