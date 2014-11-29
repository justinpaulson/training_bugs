Template.search.helpers
  bugs: ->
    Bugs.find
      tags: @search_term
    # console.log tag_results
    # title_results = Bugs.find
    #   title: 
    #     $regex: "/.*#{@search_term}.*/"
    # console.log title_results
    # description_results = Bugs.find 
    #   description: 
    #     $regex: "/.*#{@search_term}.*/"
    # console.log description_results
    # _.extend {}, tag_results, title_results, description_results
