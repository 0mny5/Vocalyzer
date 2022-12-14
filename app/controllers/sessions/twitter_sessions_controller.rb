class Sessions::TwitterSessionsController < ApplicationController

  def create
    user = User.find_or_create_from_auth_hash(auth_params)
    if user
      log_in(user)

      redirect_to users_projects_path, success: t('defaults.login_message', role: "#{User.human_attribute_name(:twitter)}")
    else
      redirect_to request.referer, danger: t('defaults.login_failed')
    end
  end

  def destroy
    log_out if logged_in?

    redirect_to root_path, success: t('defaults.logout_message')
  end

  private

  def auth_params
    request.env['omniauth.auth']
  end
end
