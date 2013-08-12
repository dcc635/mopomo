describe 'Mopomo Tests', ->
  describe 'Dan Cleary', ->
    it '', ->

define [
  'chai',
  'sinon',
  'sinonFakeTimers',
  'sinonSpy',
  'sinonSpyCall',
  'moment',
  'models/timer',
], (Chai, Sinon, SinonFakeTimers, SinonSpy, SinonSpyCall, Moment, TimerModel)->
          
  expect = Chai.expect

  describe 'timerModel', ->
    check_defaults = (timerModel) ->
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
        timerModel.start()
        setTimeout(->
          timerModel.reset()
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
        timerModel.saveDuration()
        expect(timerModel.attributes).to.deep.equal({
          hours: 1
          minutes: 2
          seconds: 3
          milliseconds: 4
          tally: 0
        })

    describe '#getElapsed', ->
      it 'should return 0 if no time elapsed since start (or never started)', ->
        timerModel = new TimerModel()
        setTimeout(->
          expect(timerModel.getElapsed()).to.equal(0)
        , 2)

      it 'should time elapsed since start (or never started)', ->
        clock = Sinon.useFakeTimers()
        elapseTime = 3000
        timerModel = new TimerModel()
        timerModel.momentLast = Moment()
        clock.tick(elapseTime)
        momentNow = Moment()
        elapsed = timerModel.getElapsed()
        expect(elapsed).to.equal(elapseTime)
        expect(timerModel.momentLast).to.deep.equal(momentNow)
        clock.restore()

    describe '#refresh', ->
      it 'should call itself if @duration > 0', =>
        clock = Sinon.useFakeTimers()
        timerModel = new TimerModel()
        timerModel.momentLast = Moment()
        timerModel.duration = Moment.duration({
          hours: 0,
          minutes: 0,
          seconds: 0,
          milliseconds: timerModel.refreshMs + 10,
        })
        Sinon.spy(timerModel, "refresh")
        timerModel.refresh()
        clock.tick(timerModel.refreshMs + 10)
        expect(timerModel.refresh.callCount).to.equal(2)
        clock.restore()

      it 'should reset @duration to 0, stop timer, and play sound if @duration < 0', =>
        clock = Sinon.useFakeTimers()
        timerModel = new TimerModel()
        timerModel.duration = Moment.duration({
          hours: 0,
          minutes: 0,
          seconds: 0,
          milliseconds: 1,
        })
        timerModel.momentLast = Moment()
        clock.tick(timerModel.refreshMs + 10)
        Sinon.spy(timerModel, "refresh")
        Sinon.spy(timerModel, "pause")
        Sinon.spy(timerModel.audioElement, "play")
        timerModel.refresh()
        expect(timerModel.duration).to.deep.equal(Moment.duration(0))
        expect(timerModel.pause.callCount).to.equal(1)
        expect(timerModel.refresh.callCount).to.equal(1)
        expect(timerModel.audioElement.play.callCount).to.equal(1)
        clock.restore()
