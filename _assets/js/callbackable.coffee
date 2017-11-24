#= require callback

@Callbackable = {
  callbacks: {}

  register_callback: (type, fn) ->
    callback = new Callback(type, fn)
    @callbacks[callback.type] ?= []
    @callbacks[callback.type].push(callback)

  run_callbacks: (type) ->
    c.run() for c in @get_callbacks(type)

  has_callback: (callback) ->
    callback.eq(c) for c in @get_callbacks(callback.type)

  get_callbacks: (type) ->
    @callbacks[type] || []
}