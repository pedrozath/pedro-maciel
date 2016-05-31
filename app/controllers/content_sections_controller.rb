class ContentSectionsController < ApplicationController
    before_filter :authorize

    def create
        @job = Job.find_by slug: params[:job_id]

        @job.content_sections.create params[:content_section].permit \
            :type, :url, :code,
            :title, :description,
            :image_file, :video_code

        redirect_to :back

    end

    def update
        @job = Job.find_by slug: params[:job_id]
        @content_section = @job.content_sections.find params[:id]
        @content_section.attributes = params[:content_section].permit \
            :type, :url, :video_code, :code,
            :title, :description,
            :image_file, :job, :url

        # render text: params

        @content_section.save!
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