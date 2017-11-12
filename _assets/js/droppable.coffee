#= require fileupload

class Droppable
	constructor: (options) ->
		for key, value of options 
			this[key] = options[key]

		@dragging_count = 0
		@bind_events()
		@files = []
		@id = parseInt @element.attr "data-id"

	bind_events: ->
		@element.on
			dragenter: (e) =>
				e.preventDefault()
				@dragging_count++
				@element.addClass("dropping")

			dragover: (e) => e.preventDefault()

			dragleave: (e) =>
				e.preventDefault()
				@dragging_count--
				if @dragging_count is 0 then @element.removeClass("dropping")

			drop: (e) =>
				e.preventDefault()
				@element.removeClass("dropping")
				files = e.originalEvent.dataTransfer.files
				for file in files
					@files.push new FileUpload 
						file: file
						wrapper: @element
						event_id: @id

@Droppable = Droppable