#= require jquery
#= require jquery_ujs
#= require logo
#= require editable
#= require droppable
#= require date_nav

# require zoomable_image
# require viewport
# require TweenMax

App = {}

$ ->
	$(".rich-text-area").each ->
		rich_text_added = false
		text_area = $(this)
		text_area.closest("form").on "submit", (e) ->
			unless rich_text_added
				e.preventDefault()
				form = $(e.currentTarget)
				form.append("<input type='hidden' name='project[description]' value=\"#{text_area.html()}\">")
				rich_text_added = true 
				form.submit()

@App = App