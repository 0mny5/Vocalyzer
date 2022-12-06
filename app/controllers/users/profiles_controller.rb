class Users::ProfilesController < ApplicationController
  def edit
    @user = current_user
  end
end
