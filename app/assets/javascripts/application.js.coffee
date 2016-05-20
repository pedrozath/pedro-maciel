#= require jquery
#= require jquery_ujs
#= require tag_selection
#= require TweenMax

class App
    constructor: (options) ->
        @[k] = options[k] for k,v of options
        @util = puts: (stuff...) -> console.log stuff...
        do @init


    init: ->
        window[k] = @util[k] for k,v of @util
        @tag_selection = []
        $("[data-tag-selection]").each (index, element) =>
        	@tag_selection.push new TagSelection
                main:         $(element)
                tag_elements: $(element).find("li")

    change_state: (state) ->
        if state isnt @current_state
            puts "changing to state"
            @current_state = state



        


$ -> window.app = new App