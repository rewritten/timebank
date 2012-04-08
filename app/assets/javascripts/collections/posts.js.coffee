class Timebank.Collections.Posts extends Backbone.Collection
  url: ->
    if self.clause
      tail = for key, value of self.clause
        key + "=" + encodeURIComponent(value)
      return '/api/posts?' + tail.join("&")
    else
      return '/api/posts'
      
  setClause: (clause) ->
    this.clause = clause
    this.fetch()
  
      
  model: Timebank.Models.Post
