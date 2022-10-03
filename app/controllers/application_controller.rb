class ApplicationController < ActionController::Base
  def current_project
    byebug
    @project = Project.find_by(id: params[:id])
  end
end
