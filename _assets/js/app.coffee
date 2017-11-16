#= require jquery/dist/jquery
#= require gsap/src/uncompressed/TweenMax
#= require gsap/src/uncompressed/plugins/ScrollToPlugin
#= require underscore/underscore

#= require tag_selection
#= require tag_system
#= require animations
#= require filter
#= require github_card

class App
  constructor: (options) ->
    @[k] = options[k] for k,v of options
    @util = puts: (stuff...) -> console.log stuff...
    window[k] = @util[k] for k,v of @util
    @body = $("body")
    @current_state = @body.attr "data-state"

    @add_to_history location.pathname
    @animation = @animations()[@current_state]()

    @animation.progress(1)

    TweenMax.staggerFromTo _.shuffle($('.logo svg g')), 0.8,
      opacity: 0
    ,
      opacity: 1
      ease: Cubic.easeInOut
      delay: 1
    , 0.075, (=> @animation.reverse())

    do @bind_events
    do @init_filter
    do @fixed_nav

  init_filter: ->
    @filter = new Filter
      elements_html: $("[data-filter]").children()
      tag_group_elements: $("[data-tag-selection]")

  assign_elements_to_filter: ->
    @filter.assign_elements $("[data-filter]").children()

  bind_events: (scope) ->
    scope = @body unless scope?

    scope.find("[data-auto-route]").on "click", (e) =>
      e.preventDefault()
      @route $(e.currentTarget).attr("href")

    scope.find("[data-route]").on "click", (e) =>
      e.preventDefault()
      @route $(e.currentTarget).attr("data-route")

    window.onpopstate = (e) => @route e.state

  fixed_nav: ->
    nav_jobs = $("[data-partial=\"nav_jobs\"]")
    nav_position = 144
    $(document).unbind "scroll"
    $(document).on "scroll", (e) =>
      limiter = Math.min $(document).scrollTop() - nav_position, 0
      nav_jobs.css top: -limiter
    $(document).trigger "scroll"

  route: (route) ->
    @change_state do ->
      if route == "/"
        state: "pages#index"
        url: "/index"

      else if route.match(/\/portfolio\/(.+)/) isnt null
        state: "portfolio#show"
        url: route

      else
        state: "portfolio#index"
        url: route

  load_state: (route_object, callback) ->
    @start_loading()
    $.ajax "#{route_object.url}.js",
      dataType: "text"
      complete: callback

  start_loading: ->
    @loading_tween = TweenMax.to $(".logo-signature"), 0.3,
      opacity: 0.5
      ease: Cubic.easeInOut
      repeat: -1

  stop_loading: ->
    @loading_tween.pause()
    TweenMax.to $(".logo-signature"), 0.3,
      opacity: 1
      ease: Cubic.easeInOut

  add_to_history: (url) -> history.pushState url, "", url

  scroll_up: (callback) ->
    TweenMax.to window, 2,
      scrollTo: { y: 0 }
      ease: Cubic.easeInOut
      onComplete: =>
        callback.call()


  change_state: (route_object) ->
    state = route_object.state
    if state isnt @current_state
      complete_animation = (data) =>
        eval data.responseText
        @stop_loading()
        @bind_events $("main")
        @body.attr "data-state", state
        @current_state = state
        @animation = @animations()[state]()
        @animation.reverse(0)
        @add_to_history route_object.url

      @load_state route_object, (data) =>
        if @animation.totalProgress() < 1
          @animation.eventCallback "onComplete", complete_animation, [data]
        else
          complete_animation.call(this, data)

      @scroll_up =>
        @animation.play()

$ ->
  unless /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test navigator.userAgent
    window.app = new App animations: animations
