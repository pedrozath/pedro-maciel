class TagSelection
    constructor: (options) ->
        @[k] = options[k] for k,v of options
        @bind_events()
        @selected_items = []
        @name = @main.attr "data-tag-selection"
        @habtm = @main.attr("data-habtm") == "true"

    to_json: ->
        name:     @name
        selected: @selected_items
        habtm:    @habtm

    bind_events: ->
        @tag_elements.on "click", (e) =>
            e.preventDefault()
            tag = $(e.currentTarget)

            if @is_selected tag
                @deselect tag
            else
                @select tag 

            @callback.call() if @callback?

        @tag_elements.find("a").on "click", (e) =>
            e.preventDefault()

    is_selected: (tag) -> 
        tag.hasClass "selected"

    select: (tag) -> 
        tag.addClass "selected"
        @selected_items.push tag.attr "data-tag"
        
    deselect: (tag) -> 
        @selected_items.splice @selected_items.indexOf(tag.attr "data-tag"), 1
        tag.removeClass "selected"

@TagSelection = TagSelection