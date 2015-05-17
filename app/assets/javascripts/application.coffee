#= require jquery
#= require jquery_ujs
#= require editable
#= require droppable
#= require zoomable_image
#= require viewport
#= require TweenMax

App =
	editables: []
	droppables: []
	zoomable_images: []

$ ->
	$("[data-editable]").each ->
		App.editables.push new Editable 
			element: $(this)

	$("[data-droppable]").each ->
		App.droppables.push new Droppable
			element: $(this)

	$("a img").each ->
		App.zoomable_images.push new ZoomableImage
			element: $(this)

	App.viewport = new Viewport

@App = App