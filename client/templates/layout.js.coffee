Template.layout.events
  "keydown #search-box": (event) ->
    if event.keyCode == $.ui.keyCode.ENTER
      window.location = "/search/#{$(event.target).val()}"

Template.layout.logged_in = -> Meteor.user()
