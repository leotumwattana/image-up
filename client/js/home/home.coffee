Template.home.rendered = ->

  Dropzone.autoDiscover = false
  $('#dropzone').dropzone
    maxFiles: 1
    accept: (file, done) ->
      FS.Utility.eachFile event, (file) ->
        Images.insert file, (error, fileObj) ->
          if error
            console.log error
            done(error)
          else
            Meteor.users.update Meteor.userId(),
              $set: { 'profile.imageId': fileObj._id }

Template.home.helpers
  images: () ->
    images = Images.find().fetch()
    console.log images
    images

  profileImageUrl: ->
    if Meteor.user()
      imageId = Meteor.user().profile.imageId
      Images.findOne(imageId).url()