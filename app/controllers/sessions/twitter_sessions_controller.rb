class Sessions::TwitterSessionsController < ApplicationController

  def create
    user = User.find_or_create_from_auth_hash(auth_params)
    if user
      log_in(user)

      flash[:success] = t('defaults.login_message', role: "#{User.human_attribute_name(:twitter)}")
    else
      flash[:danger] = t('defaults.login_failed')
    end

    redirect_to users_projects_path
  end

  def destroy
    log_out if logged_in?
    flash[:success] = t('defaults.logout_message)')
    redirect_to root_path
  end

  private

  def auth_params
    request.env['omniauth.auth']
  end
end
