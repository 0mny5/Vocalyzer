class Admin::UsersController < ApplicationController
  layout 'admin/layouts/application'
  before_action :set_user, only: %i[edit update destroy]

  def new
    @admin = AdminUser.new
  end

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).order(created_at: :desc)
  end

  def update
    @user.update!(user_params)
    redirect_to admin_users_path
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path, success: t('.success', name: "#{@user.name}")
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:id, :name, :avatar, :role)
  end

  def admin_user
    @admin = AdminUser.find(session[:id])
  end
end
