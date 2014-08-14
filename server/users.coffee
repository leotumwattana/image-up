Meteor.users.allow
  insert: (userId, doc) -> Meteor.userId() == userId
  update: (userId, doc) -> Meteor.userId() == userId
  remove: (userId, doc) -> Meteor.userId() == userId
