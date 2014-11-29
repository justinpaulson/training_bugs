Bugs = new Mongo.Collection("bugs");

Bugs.allow({
 insert: function(userId, doc) {
 // only allow posting if you are logged in
 return !! userId;
 }
});
