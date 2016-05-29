class PortfolioController < ApplicationController
    before_filter :authorize, only: [:create, :destroy, :edit, :change_cover]
    
    def create
        @job = Job.new params[:job].permit \
            :name, :when, :tags,
            :brief,:client,
            :other_tags

        @job.create_image file: params.require(:job)[:image]

        render text: @job.to_json
        @job.save

        # redirect_to :back
    end

    def destroy
        Job.find_by(slug: params[:id]).destroy
        redirect_to :back
    end

    def update
        # render text: params
        @job = Job.find_by slug: params[:id]

        unless params[:job][:image].blank?
            @cover = Image.create! file: params[:job][:image]
            @job.image = @cover
            @job.save
        end

        # render json: @job.to_json

        params[:job].delete :image

        @job.attributes = params.require(:job).permit \
            :name, :when, {tag_ids:[]},
            :brief,:client, :other_tags

        # render text: params

        @job.save

        redirect_to @job

    end

    def change_cover
        @job.image 
    end

    def index
        respond_to do |f|
            f.html
            f.js
        end

    end

    def show
        @tags = Tag.all
        @clients = Client.all
        @years = (2004..2016).to_a.reverse
        @job = Job.find_by slug: params[:id]
        respond_to do |f|
            f.html
            f.js
        end
    end
end
