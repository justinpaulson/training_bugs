Template.bugView.events
  "click #toggle-solution": (e) ->
    e.preventDefault()
    if $(e.target).html() == "Hide Solution"
      $(e.target).html "Show Solution"
      $('#solution').hide()
    else
      $(e.target).html "Hide Solution"
      $('#solution').show()

Template.bugView.helpers
  logged_in: -> Meteor.user()
