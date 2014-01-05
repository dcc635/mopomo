define (require) ->

  $ = require('jquery')
  Backbone = require('backbone')
  SignInTemplate = require('hbs!template/signin')

  ENTER_KEY = 13

  class SignInView extends Backbone.View

    initialize: ->
      @delegateEvents
        'click button.signin': 'signIn'
        'keypress input.username': 'onEnterKey'
        'keypress input.password': 'onEnterKey'
      @render()

    onEnterKey: ->
      if (e.keyCode or e.which) == ENTER_KEY
        @signIn()

    signIn: ->
      @render()
  
    render: ->
      @$el.html(SignInTemplate())
      return this
