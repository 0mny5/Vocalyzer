class Users::AnalyzeController < ApplicationController
  layout 'no_header'

  def show
    @project = Project.find(params[:project_uuid])
    @song = @project.songs.second
  end

  private

  def set_project
    @project = current_user.projects.find(params[:project][:uuid])
  end

end
