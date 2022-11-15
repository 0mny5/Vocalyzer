class SelectProjectsController < ApplicationController
  def update
    @project = Project.find(params[:project][:id])
    @song = @project.songs.first
    
    redirect_to users_project_path(@project.uuid)
  end
end
