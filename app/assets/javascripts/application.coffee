#= require jquery
#= require jquery_ujs
#= require logo
#= require editable
#= require droppable
#= require date_nav

# require zoomable_image
# require viewport
# require TweenMax

App =
	editables: []
	droppables: []
	zoomable_images: []

$ ->
	App.events = $(".event")

	App.events_offsets = []

	App.events.each -> App.events_offsets.push $(this).offset().top

	$("[data-editable]").each ->
		App.editables.push new Editable 
			element: $(this)

	$("[data-droppable]").each ->
		App.droppables.push new Droppable
			element: $(this)

	$("#logo").css
		left: 0
		bottom	: 0
		position: "absolute"
		zIndex: -1
		width: $(window).width()
		height: $(window).height()

	App.logo = new Logo 
		element: $("#logo")
		iterations: 18
		branching_rate: 5
		module_size: 20


	new DateNav $("nav.time")

@App = App