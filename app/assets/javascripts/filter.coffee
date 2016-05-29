class Filter
    constructor: (options) ->
        @[k] = options[k] for k,v of options
        @elements = []

        @tag_system = new TagSystem 
            tag_group_elements: @tag_group_elements
            callback: => @filter()

        @elements = []
        @elements_html.each (index, html) =>
            new_element = {}
            new_element.html = html
            new_element.hidden = false
            for tag_group in @tag_system.content()
                if tag_group.habtm
                    new_element[tag_group.name] = []
                    new_element[tag_group.name].push item for item in eval($(html).attr("data-#{tag_group.name}"))
                else
                    new_element[tag_group.name] = $(html).attr "data-#{tag_group.name}"

            @elements.push new_element

    filter: ->
        visible_elements = hidden_elements = $()
        for element in @elements
            if @test element
                if element.hidden
                    element.hidden = false
                    visible_elements = visible_elements.add(element.html)
            else
                unless element.hidden
                    element.hidden = true
                    hidden_elements = visible_elements.add(element.html)

        hidden_elements.addClass("hidden")
        visible_elements.removeClass("hidden")

    test: (element) ->
        veredict = true
        for criterion in @tag_system.content()
            if criterion.selected.length > 0
                veredict &&= \
                    if criterion.habtm
                        @test_multiple(element, criterion)
                    else 
                        @test_single(element, criterion)
        veredict

    test_single: (element, criterion) ->
        criterion.selected.indexOf(element[criterion.name]) > -1

    test_multiple: (element, criterion) ->
        veredict = false
        for item in criterion.selected
            veredict ||= (element[criterion.name].indexOf(item) > -1)
        veredict

@Filter = Filter