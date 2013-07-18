define(['models/timerInput'], (TimerInputModel)->
# define([], () ->
  'use strict'
  describe('Give it some context', ->
    describe('maybe a bit more context here', ->
      it('should run here few assertions', ->
        assert = chai.assert

        timerModel = new TimerInputModel()

        assert.equal(timerModel.attributes.hours, 1)
        foo = 'sup'
        assert.equal(foo, 'sup')

      )
    )
  )
)
