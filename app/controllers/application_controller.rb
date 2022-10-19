class ApplicationController < ActionController::Base
  def current_project
    session[:project_id] = Project.find_by(params[:id])
  end
end
