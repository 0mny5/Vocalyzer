class SelectProjectsController < ApplicationController
  def update
    @project = Project.find(params[:project][:id])
    @song = @project.songs.first
  end
end
