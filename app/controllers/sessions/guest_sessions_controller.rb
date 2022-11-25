class Sessions::GuestSessionsController < ApplicationController
  def create
    guest_user = User.create!(
      uid: SecureRandom.hex(10),
      name: 'ゲスト',
    )
    
    if guest_user
      log_in(guest_user)
      flash[:success] = "ゲストログインしました"
      redirect_to new_users_project_path
    end
  end

  def destroy
    log_out if logged_in?
    flash[:notice] = 'ログアウトしました'
    redirect_to root_path
  end
end
