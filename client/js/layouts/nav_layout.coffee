Template.nav_layout.events
  'click #logout': (e, f) ->
    e.preventDefault()
    alert "lala"
    Meteor.logout()
    false