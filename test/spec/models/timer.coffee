describe 'Mopomo Tests', ->
  describe 'Dan Cleary', ->
    it '', ->

define [
  'models/timer',
  'chai',
  'moment',
], (TimerModel, Chai, Moment)->
          
  expect = Chai.expect

  describe 'timerModel', ->
    log_attributes = (timerModel) ->
      console.log('Attributes:')
      for key, value of timerModel.attributes
        console.log('  ' + key + ': ' + value)

    check_defaults = (timerModel) ->
      log_attributes(timerModel)
      for key, value of timerModel.attributes
        expect(value).to.equal(0)

    describe '#constructor', ->
      it 'should have default attributes of 0', ->
        timerModel = new TimerModel()
        check_defaults(timerModel)

    describe '#reset', ->
      it 'should reset to 0 if just started', ->
        timerModel = new TimerModel()
        timerModel.reset()
        check_defaults(timerModel)

      it 'should reset to where it was previously set to', =>
        timerModel = new TimerModel()
        timerModel.set('hours', 4)
        log_attributes(timerModel)
        timerModel.start()
        setTimeout(->
          timerModel.reset()
          log_attributes(timerModel)
          expect(timerModel.attributes.hours).to.equal(4)
        , 2)

    describe '#saveDuration', ->
      it 'should save an arbitrary Moment.duration to the correct values', ->
        timerModel = new TimerModel()
        timerModel.duration = Moment.duration({
          hours: 1
          minutes: 2
          seconds: 3
          milliseconds: 4
        })
        log_attributes(timerModel)
        timerModel.saveDuration()
        log_attributes(timerModel)
        expect(timerModel.attributes).to.deep.equal({
          hours: 1
          minutes: 2
          seconds: 3
          milliseconds: 4
        })

    describe '#getElapsed', ->
      it 'should return 0 if no time elapsed since start (or never started)', ->
        timerModel = new TimerModel()
        setTimeout(->
          expect(timerModel.getElapsed()).to.equal(0)
        , 2)

      it 'should time elapsed since start (or never started)', ->
        elapseTime = 3000
        timerModel = new TimerModel()
        momentLast = Moment()
        momentNow = Moment(momentLast).add('milliseconds', elapseTime)
        elapsed = timerModel.getElapsed(momentLast, momentNow)
        expect(elapsed).to.equal(elapseTime)
        expect(timerModel.momentLast).to.equal(momentNow)

    describe '#refresh', ->

      it 'should call itself if @duration > 0', =>

      it 'should reset @duration to 0, stop timer, and play sound if @duration < 0', =>
