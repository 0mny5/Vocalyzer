class Users::AnalyzeController < ApplicationController
  layout 'no_header'

  def show
    @project = Project.find(params[:project_uuid])
    if @song.blank?
      @song = @project.songs.second
    else
    @song = @project.songs.find(params[:id])
    end
  end

  private

  def set_project
    @project = current_user.projects.find(params[:project][:uuid])
  end

end
