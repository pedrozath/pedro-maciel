class FilesController < ApplicationController
	def create
		p = Picture.create params.permit(:file, :event_id)
		p.save
		render nothing: true, status: 200
	end
end