window.Timebank =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: -> 
    console.log(window.router = new Timebank.Routers.Posts())
    Backbone.history.start()

$(document).ready ->
  Timebank.init()
