describe 'Dummy', ->
    describe 'Description', ->
      it 'should run here few assertions', ->

define ['models/timer', 'chai'], (TimerModel, Chai)->
  describe 'TimerInput', ->
    describe '#constructor', ->
      it 'should have default attributes of 0', ->
        expect = Chai.expect
        expect(1).to.equal(1)
        timerModel = new TimerModel()
        expect(timerModel.attributes.hours).to.equal(1)
