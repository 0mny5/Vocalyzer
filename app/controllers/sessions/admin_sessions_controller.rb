class Sessions::AdminSessionsController < ApplicationController
  def create
    admin = AdminUser.find_by(admin_params)
    if admin
    session[:id] = admin.id
      flash[:notice] = 'ログインしました'
      redirect_to admin_users_path
    else
      flash[:notice] = '失敗しました'
    redirect_to admin_path
    end
  end

  def destroy
    admin_logout
    redirect_to root_path
  end

  private

  def admin_params
    params.require(:admin_user).permit(:id, :name, :password)
  end
end
