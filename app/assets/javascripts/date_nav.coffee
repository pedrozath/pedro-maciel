class DateNav
	constructor: (options) ->
		options = 
			days_elems: $(".days li")
			months_elems: $(".months li")
			years_elems: $(".years li")

		@[k]=v for k,v of options
		@nav_height = $(window).height()
		@adjust_sizes()

		# $(".years li").css 	marginBottom: nav_height/$(".years li").size()
			# paddingBottom: (nav_height/12)-15
		# $(".days li").css	marginBottom: nav_height/$(".days li").size()
		@bind_events()

		$(window).on "resize", =>
			@nav_height = $(window).height()
			@adjust_sizes()

	bind_events: ->
		$(document).on "scroll", (e) =>
			index = null
			for offset,i in App.events_offsets
				if $(document).scrollTop() < offset
					index = i
					break

			unless index is null
				current_date = $(App.events[index]).data().when.split("-")
				year  = parseInt current_date[0]
				month = parseInt current_date[1]
				day   = parseInt current_date[2]

				$("nav.time [data-value]").removeClass("active")
				$("nav.time .years [data-value=\"#{year}\"]").addClass("active")
				$("nav.time .months [data-value=\"#{month}\"]").addClass("active")
				$("nav.time .days [data-value=\"#{day}\"]").addClass("active")

	adjust_sizes: ->
		@adjust_element @years_elems
		@adjust_element @months_elems
		@adjust_element @days_elems

	adjust_element: (element) ->
		text_height = parseInt element.css "font-size"
		desired_height = @nav_height/element.size()

		element.css 
			height: desired_height
			paddingTop: (desired_height-text_height)/2
			paddingBottom: (desired_height-text_height)/2

@DateNav = DateNav