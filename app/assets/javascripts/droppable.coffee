class Droppable
	constructor: (options) ->
		for key, value of options 
			this[key] = options[key]

		@dragging_count = 0
		@bind_events()

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
				@load_previews(e.originalEvent.dataTransfer.files, 0)

	load_previews: (files, index) ->
		reader = new FileReader
		reader.readAsDataURL(files[index])
		reader.onload = => 
			$("<img src=\"#{reader.result}\"/>").appendTo(@element)
			@load_previews(files,index+1) if index < files.length-1



$("[data-dropfile]").on
	dragenter: (e) ->
		e.preventDefault()
		elem = $ e.currentTarget
		elem.css background: "red"

	dragover: (e) ->
		e.preventDefault()

	drop: (e) ->
		e.preventDefault()
		reader = new FileReader();
		f = e.originalEvent.dataTransfer.files[0]
		reader.readAsDataURL(f)
		reader.onload = ->
			img = reader.result
			console.log img
			$("body").css
				backgroundImage: "url(#{img})"

@Droppable = Droppable