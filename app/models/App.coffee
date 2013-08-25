class window.App extends Backbone.Model

  initialize: ->
    @set 'player', player = new Player()
    @set 'deck', deck = new Deck()
    @set 'game', game = new Game(player, deck)
    game.on 'gameOver', @newGame, @
    player.on 'betPlaced', @startGame, @
    game.on 'dealer busted', @playerWon, @
    game.on 'won', @playerWon, @
    game.on 'player busted', @playerLost, @
    game.on 'lose', @playerLost, @
    game.on 'push', @playerPushed, @ 

  newGame: ->
    deck = @get 'deck'
    deck = new Deck() if deck.length < 15
    @set 'deck', deck
    @set 'game', game = new Game((@get 'player'), deck)
    console.log "New game"

  startGame: ->
    (@get 'game').startGame()

  playerWon: ->
    (@get 'player').playerWon()

  playerLost: ->
    (@get 'player').playerLost()

  playerPushed: ->
    (@get 'player').playerPushed()
