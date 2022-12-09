class ApplicationController < ActionController::Base
  include UserSessionsHelper
  include AdminSessionsHelper

  add_flash_types :success, :notice, :info, :warning, :danger

  def current_project
    current_user.projects.find(params[:uuid])
  end
end
