class ZoomableImage
	constructor: (options) ->
		for k,v of options
			@[k]=v

		@bind_events()

	bind_events: ->
		@element.on
			click: (e) =>
				e.preventDefault()
				$("html").css
					"-webkit-transform": "scale(#{window[dimension]/@[dimension]})"

@ZoomableImage = ZoomableImage