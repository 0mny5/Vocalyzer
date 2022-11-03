class Users::AnalyzeController < ApplicationController

  def show
    @project = current_user.projects.find(params[:project_uuid])
    @song = @project.songs.second
  end

  private

  def set_project
    @project = current_user.projects.find(params[:project][:uuid])
  end

end
