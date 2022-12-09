class UsersController < ApplicationController
  def update
    @user = User.find(current_user.id)

    if @user.update(user_params)
      redirect_to users_profile_path
    else
      render 'users/profiles/edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :name, :avatar)
  end
end
