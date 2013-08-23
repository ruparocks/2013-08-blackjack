#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    (@get 'playerHand').on 'busted', @resetGame, @

  stand: ->
    dealerHand = @get 'dealerHand'
    dealerHand.at(0).flip()
    dealerHand.hit() while dealerHand.scores()[0] < 15
    @compareScores()
    @resetGame()

  compareScores: ->
    #not checking all score totals for the ace
    console.log "You lose! :(" if (@get 'dealerHand').scores()[0] > (@get 'playerHand').scores()[0]
    console.log "You win! :D" if (@get 'dealerHand').scores()[0] < (@get 'playerHand').scores()[0]
    console.log "You push. :|" if (@get 'dealerHand').scores()[0] == (@get 'playerHand').scores()[0]

  resetGame: ->
    @initialize()