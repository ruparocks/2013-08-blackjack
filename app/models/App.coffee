class window.App extends Backbone.Model

  initialize: ->
    @set 'player', player = new Player()
    @set 'deck', deck = new Deck()
    @set 'game', game = new Game(player, deck)