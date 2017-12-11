#= require callback

@Callbackable =
  register_callback: (type, fn) ->
    c = new Callback(type, fn)
    @callbacks ?= {}
    @callbacks[c.type] ?= []
    @callbacks[c.type].push(c)

  run_callbacks: (type) ->
    c.run() for c in @get_callbacks(type)

  has_callback: (callback) ->
    callback.eq(c) for c in @get_callbacks(callback.type)

  get_callbacks: (type) ->
    @callbacks[type] || []