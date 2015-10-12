class ProjectsController < ApplicationController
    def index
        @projects = Project.all.group_by do |p|
            Integer p["date"].strftime "%Y"
        end
    end

    def show
        @project = Project.find params[:id]
    end

    def create
        params[:project][:date] = Date.new *%w(1 2 3).map { |e| params[:project]["date(#{e}i)"].to_i }
        p = Project.create params[:project].permit(:name, :description, :date)
        if p.valid? then p.save end
        redirect_to :back
    end

    def destroy
        Project.find(params[:id]).destroy
        redirect_to :back
    end

end