class Sessions::GuestSessionsController < ApplicationController
  def create
    guest_user = User.create!(
      uid: SecureRandom.hex(10),
      name: "#{User.human_attribute_name(:guest)}"
    )
    
    if guest_user
      log_in(guest_user)

      redirect_to new_users_project_path, success: t('defaults.login_message', role: "#{User.human_attribute_name(:guest)}")
    end
  end

  def destroy
    log_out if logged_in?

    redirect_to root_path, success: t('defaults.logout_message')
  end
end
