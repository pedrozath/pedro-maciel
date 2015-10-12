class MoviesController < ApplicationController
	def index
		@movies = Movie.all
	end
	def create
		for file in params[:movie][:files]
			p = Project.find(params[:movie][:project]).movies.new
			p.file = file
			p.save!
		end
		redirect_to :back
	end
end