#= require jquery
#= require jquery_ujs
#= require editable

App = {
	editables: []
}

$ ->
	$("[data-editable]").each ->
		App.editables.push new Editable 
			element: $(this)

@App = App