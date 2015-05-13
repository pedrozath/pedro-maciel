#= require jquery
#= require jquery_ujs
#= require editable
#= require droppable

App =
	editables: []
	droppables: []

$ ->
	$("[data-editable]").each ->
		App.editables.push new Editable 
			element: $(this)

	$("[data-droppable]").each ->
		App.droppables.push new Droppable
			element: $(this)

@App = App