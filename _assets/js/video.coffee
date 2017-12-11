#= require callbackable

class @Video
  loaded: false

  constructor: ($el) ->
    @$el = $el
    @src = @$el.attr('data-src')

  rewind: ->
    @$el.get(0).currentTime = 0
    this

  preload: ->
    return false if @loading_request?
    # @hide()

    r = new XMLHttpRequest()
    r.open('GET', @src, true)
    r.responseType = 'blob'

    r.onload = (e) =>
      if r.status == 200
        @loaded = true
        @run_callbacks('afterLoad')
        @$el.get(0).src = URL.createObjectURL(r.response)

    @loading_request = r
    @loading_request.send()
    this

  play: ->
    if @$el.attr('src') == undefined
      @$el.attr('src', @$el.attr('data-src'))
    @show()
    @$el.get(0).play()
    this

  stop: ->
    @pause().rewind()

  pause: ->
    @$el.get(0).pause()
    this

  hide: ->
    @$el.hide()
    this

  show: ->
    @$el.show()
    this

_.extend(Video::, Callbackable)