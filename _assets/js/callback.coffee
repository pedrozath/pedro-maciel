class @Callback
  constructor: (type, fn) ->
    @type = type
    @fn = fn

  run: ->
    @fn.call()

  eq: (callback) ->
    @type == callback.type and
      @fn == fn