class window.AppView extends Backbone.View
  initialize: ->
    @render()
    #@model.on "gameOver", @render, @
    @model.on 'change', @render, @

  render: ->
    @$el.html new PlayerView(model: @model.get("player")).el
    @$el.append new GameView(model: @model.get("game")).el
    @$el.append new InfoView(model: @model.get("game")).el
