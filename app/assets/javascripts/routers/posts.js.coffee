class Timebank.Routers.Posts extends Backbone.Router
  routes:
    '': 'index'
    'posts': 'index'
    'posts[type=:type]': 'filterByType'
    'posts/:id': 'show'
    
  initialize: ->
    @collection = new Timebank.Collections.Posts()
    @collection.fetch()
  
  index: ->
    view = new Timebank.Views.PostsIndex(collection: @collection)
    $('#container').html(view.render().el)
    
  show: (id) ->
    alert "Post #{id}"
    
  filterByType: (type) ->
    @collection or= new Timebank.Collections.Posts()
    @collection.setClause(type: type)
