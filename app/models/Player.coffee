class window.Player extends Backbone.Model

  defaults:
    'chips': 100
    'currentBet': 0

  playerWon: ->
    @set 'chips', ((@get 'currentBet') * 2)

  playerLost: ->
    @set 'chips', ((@get 'chips') - (@get 'currentBet'))

  playerPushed: ->
    currentBet = 0