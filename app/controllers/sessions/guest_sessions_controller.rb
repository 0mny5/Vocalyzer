class Sessions::GuestSessionsController < ApplicationController
  def create
    guest_user = User.create!(
      uid: SecureRandom.hex(10),
      name: "#{User.human_attribute_name(:guest)}"
    )
    
    if guest_user
      log_in(guest_user)

      flash[:success] = t('defaults.login_message', role: "#{User.human_attribute_name(:guest)}")
      redirect_to new_users_project_path
    end
  end

  def destroy
    log_out if logged_in?

    flash[:success] = t('defaults.logout_message')
    redirect_to root_path
  end
end
