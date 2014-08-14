Router.configure
  layoutTemplate: 'layout'

Router.map ->
  @route 'login', { path: '/' }
  @route 'registration'
  @route 'home', { layoutTemplate: 'nav_layout' }

autoLogin = (pause) ->
  Router.go 'home' if Meteor.userId()

requireLogin = (pause) ->
  Router.go '/' unless Meteor.userId()

Router.onBeforeAction autoLogin, { only: ['login', 'registration'] }
Router.onBeforeAction requireLogin, { only: 'home' }
