passwordIsValid = (password) ->
  password.length >= 3

passwordIsConfirmed = (password, confirm) ->
  password == confirm

Template.registration.events
  'submit form': (e, t) ->
    e.preventDefault()

    email = t.find('#accounts-email').value
    password = t.find('#accounts-password').value
    confirm = t.find('#accounts-confirm').value

    if passwordIsValid(password) && passwordIsConfirmed(password, confirm)
      Accounts.createUser
        email: email
        password: password
        profile:
          name: 'Joe Schmoe'
      , (error) ->
        if error
          console.log error
        else
          console.log "Success. Logged in at:"
          console.log Meteor.user()
          Router.go 'home'
    else
      console.log "Problem with password"

    false