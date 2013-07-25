console.log('yo')
define(['models/timerInput'], (TimerInputModel)->
  describe('Give it some context', ->
    describe('maybe a bit more context here', ->
      it('should run here few assertions', ->
        assert = chai.assert
        timerModel = new TimerInputModel()
        console.log('yo2')
        assert.equal(timerModel.attributes.hours, 1)
      )
    )
  )
)
