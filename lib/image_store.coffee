imageStore = new FS.Store.FileSystem 'images',
  path: "~/uploads"
  maxTries: 5

@Images = new FS.Collection 'images',
  stores: [imageStore]
  filter:
    maxSize: 1048576
    allow:
      contentTypes: ['image/*']
      extensions: ['png', 'jpg']
    onInvalid: (message) ->
      if Meteor.isClient
        alert message
      else
        console.log message