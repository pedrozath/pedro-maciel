class Filter
    constructor: (options) ->
        @[k] = options[k] for k,v of options
        @elements = []

        @tag_system = new TagSystem 
            tag_group_elements: @tag_group_elements
            callback: => @filter()

        @assign_elements @elements_html

    assign_elements: (elements_html) ->
        @elements = []
        elements_html.each (index, html) =>
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

    visible_elements: ->
        collection = $()
        for element in @elements
            if @test element
                collection = collection.add element.html
        collection

    filter: ->
        elements_to_show = elements_to_hide = $()
        for element in @elements
            if @test element
                if element.hidden
                    element.hidden = false
                    elements_to_show = elements_to_show.add(element.html)
            else
                unless element.hidden
                    element.hidden = true
                    elements_to_hide = elements_to_hide.add(element.html)

        TweenMax.staggerTo elements_to_hide, 0.18,
            z: -100
            opacity: 0.2
            ease: Cubic.easeOut
            transformOrigin: "50% 50%"
        , 0.03

        TweenMax.staggerTo elements_to_show, 0.18,
            z: 0
            opacity: 1
            ease: Cubic.easeOut
            transformOrigin: "50% 50%"
        , 0.03

        TweenMax.to window, 0.2, scrollTo: { y: @visible_elements().first().offset().top - 24 }

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