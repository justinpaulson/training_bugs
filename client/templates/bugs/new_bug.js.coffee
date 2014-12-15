Template.newBug.events
  "click #save": (e) ->
    tags = $("[name='tags']").val().split(/,\s*/)
    tags = _.reject tags,(tag) -> tag==""
    Bugs.insert
      _id:  new Meteor.Collection.ObjectID(),
      title: $("[name='title']").val(),
      story_number: $("[name='story_number']").val(),
      branch: $("[name='branch']").val(),
      description: $("[name='description']").val(),
      difficulty: $("[name='difficulty']").val(),
      tags: tags,
      solution: $("[name='solution']").val(),
      createdAt: new Date()

    window.location = "/"

  "click #cancel": (e) ->
    window.location = "/"
 
  "keydown #tags": (event) ->
    if event.keyCode == $.ui.keyCode.TAB
      event.preventDefault()

  "click #import-story": (e) ->
    e.preventDefault()
    Meteor.call "getPivotalStory", $("[name='story_number']").val(), (error, results) ->
      content = JSON.parse(results.content)
      $("[name='title']").val content.name
      $("[name='description']").val content.description

Template.newBug.rendered = () ->

  Meteor.call "getTags", (error, results) => 
    availableTags = results
    $("#tags")
      .autocomplete
        minLength: 0,
        source: (request, response) -> response( $.ui.autocomplete.filter(availableTags, extractLast(request.term))),
        focus: -> false,
        select: (event, ui) ->
          terms = split this.value
          terms.pop()
          terms.push ui.item.value
          terms.push ""
          this.value = terms.join ", "
          false

  split = (val) ->
    val.split( /,\s*/ )

  extractLast = (term) ->
    split(term).pop()

