class window.Deck extends Backbone.Collection

  model: Card

  initialize: ->
    @add _(_.range(1, 53)).shuffle().map (card) ->
      new Card
        rank: card % 13
        suit: Math.floor(card / 13)

  dealPlayer: ->
    hand = new Hand [ @pop(), @pop() ], @
    if hand.scores().length == 2 && hand.scores()[1] == 21
      console.log "Blackjack"
      @trigger 'blackjack', @
    hand

  dealDealer: -> new Hand [ @pop().flip(), @pop() ], @, true
