class PortfolioController < ApplicationController
    before_filter :authorize, only: [:create, :destroy, :edit, :change_cover]
    
    def create
        @client = Client.find(params[:job][:client])
        @client.jobs.new params[:job].permit \
            :name, :when, :tags,
            :brief, :other_tags, :image_file

        @client.save!

        redirect_to :back
    end

    def destroy
        Job.find_by(slug: params[:id]).destroy
        redirect_to :back
    end

    def update
        # render text: params
        @job = Job.find_by slug: params[:id]

        @job.attributes = params.require(:job).permit \
            :name, :when, {tag_ids:[]},
            :brief,:client, :other_tags, :image_file

        @job.save

        redirect_to :back

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
