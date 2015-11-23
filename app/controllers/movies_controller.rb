class MoviesController < ApplicationController
	def index
		@movies = Movie.all
	end
	def create
		p = Project.find(params[:movie][:project]).movies.new
		p.file = params[:movie][:file]
		p.save!
		redirect_to :back
	end
end