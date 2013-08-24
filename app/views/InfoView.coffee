class window.InfoView extends Backbone.View

  initialize: ->
    _.bindAll @
    @model.on 'dealer busted', @dealerBusted, @
    @model.on 'player busted', @playerBusted, @
    @model.on 'win', @win, @
    @model.on 'lose', @lose, @
    @model.on 'push', @push, @
    $('.modal').dialog({ modal:true, autoOpen: false })
    $('.modal button').on 'click', @newGame

  dealerBusted: ->
    $('#message1').text("The dealer busted.")
    $('#message2').text("YOU WIN!")
    $('.modal').dialog "open"

  playerBusted: ->
    $('#message1').text("Oh no, you busted.")
    $('#message2').text("YOU LOSE!")
    $('.modal').dialog "open"

  win: ->
    $('#message1').text("You beat the dealer.")
    $('#message2').text("YOU WIN!")
    $('.modal').dialog "open"

  lose: ->
    $('#message1').text("The dealer beat you.")
    $('#message2').text("YOU LOSE!")
    $('.modal').dialog "open"

  push: ->
    $('#message1').text("You tied with the dealer.")
    $('#message2').text("YOU PUSH!")
    $('.modal').dialog "open"

  newGame: ->
    @model.trigger "gameOver", @model
    $('.modal').dialog "close"
    console.log "trigger fired"