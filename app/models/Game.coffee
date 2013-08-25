#todo: refactor to have a game beneath the outer blackjack model
class window.Game extends Backbone.Model

  initialize: (player, deck) ->
    @set 'player', player
    @set 'deck', deck
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    (@get 'playerHand').on 'busted', @stand, @
    (@get 'dealerHand').on 'busted', @stand, @
    if (@get 'playerHand').scores().length == 2 && (@get 'playerHand').scores()[1] == 21
      @stand()

  stand: ->
    dealerHand = @get 'dealerHand'
    dealerHand.at(0).flip()
    dealerHand.hit() while dealerHand.scores()[0] < 15
    @compareScores()
    that = @
    setTimeout ( ->
      console.log "Game over!"
    ), 500

  compareScores: ->
    #not checking all score totals for the ace
    playerScores = (@get 'playerHand').scores()
    dealerScores = (@get 'dealerHand').scores()
    playerScores.shift() if playerScores.length == 2 and playerScores[1] <= 21
    dealerScores.shift() if dealerScores.length == 2 and dealerScores[1] <= 21
    if dealerScores[0] > 21
      @trigger "dealer busted", @
    if playerScores[0] > 21
      @trigger "player busted", @
    else
      @trigger "lose", @ if dealerScores[0] > playerScores[0]
      @trigger "win", @ if dealerScores[0] < playerScores[0]
      @trigger "push", @ if dealerScores[0] == playerScores[0]

  startGame: ->
    (@get 'playerHand').at(0).flip()
    (@get 'playerHand').at(1).flip()
    (@get 'dealerHand').at(1).flip()