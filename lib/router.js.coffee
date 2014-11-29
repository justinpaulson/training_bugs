Router.configure
 layoutTemplate: 'layout'

Router.route '/', name: 'bugList'
Router.route '/bugs/new', name: 'newBug'
Router.route '/bugs/:_id', 
  name: 'bugView',
  data: -> Bugs.findOne(new Meteor.Collection.ObjectID(@params._id))
Router.route '/bugs/:_id/edit',
  name: 'bugEdit',
  data: -> Bugs.findOne(new Meteor.Collection.ObjectID(@params._id))
Router.route '/search/:search_term',
  name: 'search',
  data: -> search_term: @params.search_term
