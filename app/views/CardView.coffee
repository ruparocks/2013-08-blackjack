class window.CardView extends Backbone.View
  id: 'card'

  className: ->
    @model.attributes.suitName + @model.attributes.rankName

  template: _.template '<%= rankName %> of <%= suitName %>'

  initialize: ->
    @model.on 'change', => @render
    @render()

  render: ->
    @$el.children().detach().end().html
    @$el.html @template @model.attributes
    @$el.addClass 'covered' unless (@model.get 'revealed')
