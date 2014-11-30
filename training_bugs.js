if (Meteor.isClient) {
  // This code only runs on the client
}

if (Meteor.isServer) {
  Meteor.startup(function () {
    // code to run on server at startup
  });

  Meteor.methods({getPivotalStory: function (storyID) {
    var url = "https://www.pivotaltracker.com/services/v5/stories/" + storyID;
    try{
      var result = HTTP.get(url, {headers: {"X-TrackerToken": "0aa00f0f19d51bf715ed85684eda8925"}});
      return result;
    } catch (e) {
      return false;
    }
  }});
}
