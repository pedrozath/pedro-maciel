class ZoomableImage
	constructor: (options) ->
		for k,v of options
			@[k]=v

		@bind_events()
		@zoomed = false

	bind_events: ->
		@element.on
			click: (e) =>
				if !@zoomed
					e.preventDefault()
					scale = (window.outerHeight-200)/@element.height()
					# scale = 1
					x = (window.innerWidth/2)-(@element.offset().left+@element.width()/2)
					y = (window.innerHeight/2)-(@element.offset().top+@element.height()/2)+100

					console.log x,y,scale

				else
					scale = 1
					x = 0
					y = 0

				@zoomed = !@zoomed
				$("body").css
					"-webkit-transition": "all cubic-bezier(.39,.7,.48,1) 300ms"
					"-webkit-transform": [
							"translate(#{x}px,#{y}px)"
							"scale(#{scale})",
						].join(" ")


@ZoomableImage = ZoomableImage