class ApplicationController < ActionController::Base
  include UserSessionsHelper

  def current_project
    current_user.projects.find(params[:uuid])
  end
end
