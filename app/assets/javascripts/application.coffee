#= require jquery
#= require jquery_ujs
#= processing
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

	new DateNav $("nav.time")
@App = App