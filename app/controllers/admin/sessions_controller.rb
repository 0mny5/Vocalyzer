class Admin::SessionsController < ApplicationController
  def new
    @admin = AdminUser.new
  end

  def create
    admin = AdminUser.find_by(admin_params)

    if admin
      session[:id] = admin.id

      flash[:success] = t('defaults.login_message', role: "#{AdminUser.model_name.human}")
      redirect_to admin_users_path
    else
      flash[:danger] = t('defaults.login_failed')
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
