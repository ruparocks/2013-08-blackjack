class window.GameView extends Backbone.View

  template: _.template '
    <div class="game-buttons"><button class="hit-button btn btn-success">Hit</button><button class="stand-button btn btn-danger">Stand</button></div>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    "click .hit-button": -> @model.get('playerHand').hit()
    "click .stand-button": -> @model.stand()

  initialize: ->
    @render()
    @model.on 'change', @render, @

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
