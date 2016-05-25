#= require jquery
#= require jquery_ujs
#= require tag_selection
#= require TweenMax
#= require animations

class App
    constructor: (options) ->
        @[k] = options[k] for k,v of options
        @util = puts: (stuff...) -> console.log stuff...
        window[k] = @util[k] for k,v of @util
        @body = $("body")
        @current_state = @body.attr "data-state"
        do @bind_events

    bind_events: ->
        @tag_selection = []
        $("[data-tag-selection]").each (index, element) =>
            @tag_selection.push new TagSelection
                main:         $(element)
                tag_elements: $(element).find("li")

        $(".projects a").on "click", => @change_state "jobs/show"
        $(".logo").on "click", => @change_state "jobs/index"

    load_data: (state, callback) ->
        $.get "#{state}.json", =>
            
            callback.call() if callback?

    change_state: (state) ->
        if state isnt @current_state
            @animations[@current_state].addCallback =>
                @load state, ->
                    @body.attr "data-state", state
                    @animations[state].reverse()
                
            @animations[@current_state].play()
            @current_state = state

$ -> 
    window.app = new App
        animations: animations()