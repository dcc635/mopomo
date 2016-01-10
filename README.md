# MoPomo

MoPomo is a web incarnation of the [Pomodoro Technique](http://en.wikipedia.org/wiki/Pomodoro_Technique) built on Backbone.js.

Check out the demo [here](http://dcc635.github.io/mopomo/). Just enter a time for your Pomodoro and Mo-Po-Go!

# Tools

Backbone.js: MVC framework for JavaScript

Yeoman:
* yo: project scaffolding
* bower: dependency manager
* grunt: environment builder

Bootstrap: HTML/CSS/JS framework (Darkstrap mod)

CoffeeScript: Clean language that transcompiles to JavaScript

Moment.js: timer library

Require.js: asynchronous packages loader

blanket.js: code coverage

mocha.js: unit testing

chai.js: provides "should" syntax for unit testing

sinon.js: provides spies, mocks for unit testing

# Getting Started

## Install and Run the Django App

(Note: Python 3 is required to run this application.)

```bash
$ cd django_
$ pip install -r requirements.txt
$ python manage.py runserver 3000
```

## Install and Run the Backbone App

```bash
$ cd backbone_
$ npm install
$ bower install
$ grunt server
```
