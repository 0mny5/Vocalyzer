class AnalyzeController < ApplicationController
  before_action :set_project, only: %i[show]
  def index
  end

  def show
    @song = @project.songs.second
    # redirect_to project_path(@project)
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

end
