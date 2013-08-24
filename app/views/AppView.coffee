class window.AppView extends Backbone.View
  initialize: ->
    @render()

  render: ->
    @$el.html new GameView(model: @model.get("game")).el
    @$el.prepend new PlayerView(model: @model.get("player")).el
