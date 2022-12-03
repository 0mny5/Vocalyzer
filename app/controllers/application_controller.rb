class ApplicationController < ActionController::Base
  include UserSessionsHelper
  include AdminSessionsHelper

  def current_project
    current_user.projects.find(params[:uuid])
  end
end
