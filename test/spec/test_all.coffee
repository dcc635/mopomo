console.log('wassup guys')
mocha.setup({ui: 'bdd', ignoreLeaks: true})
mocha.run()
requirejs(['spec/test_dan'],
  () ->
)