class window.PlayerView extends Backbone.View
  template: _.template '<div class="player-chips-container"><div class="label">Chips: <%= chips %> </div></div>'

  initialize: ->
    @render()
    @model.on 'change', @render, @

  render: ->
    @$el.html @template @model.attributes