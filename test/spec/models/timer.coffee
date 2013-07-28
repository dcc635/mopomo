define ['../../test/lib/chai'], (Chai) ->
  expect = chai.expect
  define ['models/timer'], (TimerModel)->
    
    describe 'TimerInput', ->
      describe '#constructor', ->
        it 'should have default attributes of 0', ->
          timerModel = new TimerModel()
          expect(timerModel.attributes.hours).to.equal(1)
