class TagSystem
    constructor: (options) ->
        @[k] = options[k] for k,v of options
        @tag_groups = []
        @tag_group_elements.each (index, element) =>
            @tag_groups.push \
                new TagSelection
                    main:         $(element)
                    tag_elements: $(element).find("li")
                    callback: @callback
                    mouseenter: @mouseenter
                    mouseleave: @mouseleave

    content: -> t.to_json() for t in @tag_groups


@TagSystem = TagSystem