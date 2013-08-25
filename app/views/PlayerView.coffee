class window.PlayerView extends Backbone.View
  template: _.template '<div class="player-chips-container"><p><span class="chips">Chips: </span><span class="badge badge-warning"><%= chips %> </span></p>
    <input class="bet" type="text" placeholder="Place your bet here"></input><button class="btn btn-mini">Submit</button></div>'

  events:
    'click .btn-mini': 'placeBet'

  initialize: ->
    @render()
    @model.on 'change', @render, @

  render: ->
    @$el.html @template @model.attributes

  placeBet: ->
    console.log "view bet trigger"
    bet = $('.bet').val()
    if bet <= @model.get 'chips'
      @model.trigger 'betPlaced', @
      @model.set 'currentBet', bet
    $('.bet').val("")