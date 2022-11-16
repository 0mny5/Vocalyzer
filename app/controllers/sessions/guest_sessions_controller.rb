class Sessions::GuestSessionsController < Sessions::SessionController
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
end
