Template.bugEdit.events
  "click #save": (e) ->
    tags = $("[name='tags']").val().split(/,\s*/)
    tags = _.reject tags,(tag) -> tag==""
    Bugs.update @_id,
      $set:
        title: $("[name='title']").val(),
        story_number: $("[name='story_number']").val(),
        description: $("[name='description']").val(),
        tags: tags,
        solution: $("[name='solution']").val()

    window.location = "/bugs/#{@_id._str}"

  "click #cancel": (e) ->
    window.location = "/bugs/#{@_id._str}"
 
  "keydown #tags": (event) ->
    if event.keyCode == $.ui.keyCode.TAB
      event.preventDefault()

Template.bugEdit.rendered = () ->
  availableTags = [
      "Client",
      "Server",
      "Backbone",
      "Underscore",
      "Moment",
      "Ruby",
      "Rails",
      "Javascript",
      "Coffeescript"
    ]

  split = (val) ->
    val.split( /,\s*/ )

  extractLast = (term) ->
    split(term).pop()

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
