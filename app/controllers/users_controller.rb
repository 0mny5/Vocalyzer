class UsersController < ApplicationController
  def update
    @user = User.find(params[:id])
    @user.update(user_params)

    redirect_to users_profile_path
  end

  private

  def user_params
    params.require(:user).permit(:id, :name, :avatar)
  end
end
