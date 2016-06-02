class ContentSectionsController < ApplicationController
    before_filter :authorize

    def create
        @job = Job.find_by slug: params[:job_id]


        @csection = @job.content_sections.new params[:content_section].permit \
            :type, :url, :code,
            :title, :description,
            :image_file, :video_code

        if params.require(:content_section)[:technologies].nil?
            @csection.technologies = params.require(:content_section)[:technologies].split(", ")
        end

        @csection.save!
        redirect_to :back

    end

    def update
        @job = Job.find_by slug: params[:job_id]
        @csection = @job.content_sections.find params[:id]
        @csection.attributes = params[:content_section].permit \
            :type, :url, :video_code, :code,
            :title, :description,
            :image_file, :job, :url

        unless params.require(:content_section)[:technologies].nil?
            @csection.technologies = params.require(:content_section)[:technologies].split(", ")
        end

        @csection.save!
        redirect_to :back
    end

    def destroy
        @job = Job.find_by slug: params[:job_id]
        @job.content_sections.find(params[:id]).destroy
        redirect_to :back
    end

    def move
        @job = Job.find_by(slug: params[:job])
        @section = @job.content_sections.find(params[:id])
        @section.move_to params[:direction].to_sym
        @section.save
        redirect_to :back
    end

end