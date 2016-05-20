class TagSelection
    constructor: (options) ->
        @[k] = options[k] for k,v of options
        @bind_events()

    bind_events: ->
        @tag_elements.on "click", (e) =>
            e.preventDefault()
            tag = $(e.currentTarget)

            puts @is_selected tag

            if @is_selected tag
                @deselect tag
            else
                @select tag 

    is_selected: (tag) -> 
        tag.hasClass "selected"

    select: (tag) -> tag.addClass "selected"
    deselect: (tag) -> tag.removeClass "selected"

@TagSelection = TagSelection