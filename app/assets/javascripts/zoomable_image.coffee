class ZoomableImage
	constructor: (options) ->
		for k,v of options
			@[k]=v

		@bind_events()
		@zoomed = false

		$(document).on "mousemove", (e) ->
			console.log e.pageX, e.pageY

	bind_events: ->
		@element.on
			click: (e) =>
				if !@zoomed
					window_smallest_dimension = Math.min $(window).height(), $(window).width()
					element_dimension = 
						if window_smallest_dimension == $(window).height()
							@element.height()
						else
							@element.width()

					element_middle = 
						x: @element.offset().left+@element.outerWidth()/2
						y: @element.offset().top+@element.outerHeight()/2

					$("html").css transformOrigin: "#{element_middle.x}px #{element_middle.y}px"
					@properties =
						scale: window_smallest_dimension/element_dimension
				else
					@properties = scale: 1

				new TweenMax $("html"), 1, @properties

				@zoomed = !@zoomed

@ZoomableImage = ZoomableImage