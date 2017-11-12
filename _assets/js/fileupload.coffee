class FileUpload
	constructor: (options) -> 
		for k,v of options then @[k] = v
		@load_preview()

	load_preview: ->
		reader = new FileReader
		reader.readAsDataURL @file
		reader.onload = (e) =>
			@element = $([
				"<div>",
					"<img src=\"#{reader.result}\"/>"		
				"</div>"
			].join()).appendTo(@wrapper)

			@send()

	send: ->
		fd = new FormData
		fd.append "file", @file, @file.name
		fd.append "event_id", @event_id
		console.log fd, @event_id
		request = $.ajax
			url: "/files"
			data: fd
			processData: false
			contentType: false
			type: "POST"

		@change_state "progress"
		request.success =>
			@wrapper.append "<p>done</p>"
			@change_state "success"

	change_state: (status) -> @element.attr "data-state", status

@FileUpload = FileUpload