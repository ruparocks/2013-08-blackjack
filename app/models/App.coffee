class window.App extends Backbone.Model

  initialize: ->
    @set 'player', player = new Player()
    @set 'deck', deck = new Deck()
    @set 'game', game = new Game(player, deck)
    game.on 'gameOver', @newGame, @

  newGame: ->
    deck = @get 'deck'
    deck = new Deck() if deck.length < 15
    @set 'deck', deck
    @set 'game', game = new Game((@get 'player'), deck)
    console.log "New game"