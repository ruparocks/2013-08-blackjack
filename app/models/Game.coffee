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
      console.log "Blackjack"
      @stand()

  stand: ->
    dealerHand = @get 'dealerHand'
    dealerHand.at(0).flip()
    dealerHand.hit() while dealerHand.scores()[0] < 15
    @compareScores()
    that = @
    setTimeout ( ->
      alert "Game over!"
      that.resetGame()
    ), 500

  compareScores: ->
    #not checking all score totals for the ace
    playerScores = (@get 'playerHand').scores()
    dealerScores = (@get 'dealerHand').scores()
    playerScores.shift() if playerScores.length == 2 and playerScores[1] <= 21
    dealerScores.shift() if dealerScores.length == 2 and dealerScores[1] <= 21
    if dealerScores[0] > 21
      console.log "You win. Dealer busted!"
    if playerScores[0] > 21
      console.log "You lose. You busted!"
    else
      console.log "You lose! :(" if dealerScores[0] > playerScores[0]
      console.log "You win! :D" if dealerScores[0] < playerScores[0]
      console.log "You push. :|" if dealerScores[0] == playerScores[0]

  resetGame: ->
    @initialize()