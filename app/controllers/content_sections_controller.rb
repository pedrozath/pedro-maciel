class ContentSectionsController < ApplicationController
    before_filter :authorize

    def create
        @job = Job.find_by slug: params[:job_id]

        @job.content_sections.create params[:content_section].permit \
            :type, :url,
            :title, :description,
            :image_file

        redirect_to :back

    end

    def update
        @job = Job.find_by slug: params[:job_id]
        @content_section = @job.content_sections.find params[:id]
        @content_section.attributes = params[:content_section].permit \
            :type, :url,
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

end