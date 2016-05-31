class PortfolioController < ApplicationController
    before_filter :authorize, except: [:index, :show]
    
    def create
        @client = Client.find(params[:job][:client])
        @job = @client.jobs.new params[:job].permit \
            :name, :when, {tag_ids:[]},
            :brief, :other_tags, :image_file
        @job.credits = eval "#{params[:job][:credits]}"
        @job.save
        
        redirect_to :back
    end

    def destroy
        Job.find_by(slug: params[:id]).destroy
        redirect_to :back
    end

    def update
        @job = Job.find_by slug: params[:id]
        @job.client = Client.find params.require(:job)[:client]
        # render text: @job.client.to_json
        @job.attributes = params.require(:job).permit \
            :name, :when, {tag_ids:[]},
            :brief, :other_tags, :image_file
        @job.credits = eval "#{params[:job][:credits]}"
        @job.save!
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
