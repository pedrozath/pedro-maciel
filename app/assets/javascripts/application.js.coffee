#= require jquery
#= require jquery_ujs
#= require tag_selection
#= require tag_system
#= require TweenMax
#= require animations
#= require filter

class App
    constructor: (options) ->
        @[k] = options[k] for k,v of options
        @util = puts: (stuff...) -> console.log stuff...
        window[k] = @util[k] for k,v of @util
        @body = $("body")
        @animations = @animations_template()
        @current_state = @body.attr "data-state"
        @add_to_history location.pathname
        do @bind_events



    bind_events: (scope) ->
        scope = @body unless scope?


        if scope.find("[data-filter]")
            @filter = new Filter
                elements_html: scope.find("[data-filter]").children()
                tag_group_elements: scope.find("[data-tag-selection]")

        scope.find("[data-auto-route]").on "click", (e) => 
            e.preventDefault()
            @route $(e.currentTarget).attr("href")

        scope.find("[data-route]").on "click", (e) =>
            e.preventDefault()
            @route $(e.currentTarget).attr("data-route")
        
        window.onpopstate = (e) => @route e.state

    refresh_animations: -> @animations = @animations_template()

    route: (route) ->
        @change_state do ->
            if route == "/"
                state: "pages#index"
                url: "/index"

            else if route.match(/\/jobs\/(.+)/) isnt null
                state: "jobs#show"
                url: route

            else
                state: "jobs#index"
                url: route

    load_state: (route_object, callback) ->
        $.get "#{route_object.url}.js", (data) =>
            callback.call() if callback?
            @bind_events($("main"))

    add_to_history: (url) -> history.pushState url, "", url

    change_state: (route_object) ->
        state = route_object.state
        if state isnt @current_state
            @add_to_history route_object.url
            on_complete = =>
                @current_state = state
                @load_state route_object, =>
                    @body.attr "data-state", state
                    @refresh_animations()
                    @animations[state].reverse(0)

            @animations[@current_state].eventCallback "onComplete", on_complete
            @animations[@current_state].play()

$ -> 
    window.app = new App
        animations_template: animations