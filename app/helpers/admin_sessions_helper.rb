module AdminSessionsHelper
  def current_admin_user
    if session[:id]
      @current_admin_user ||= AdminUser.find(session[:id])
    end
  end

  def admin_logout
    session.delete(:id)
    @current_admin_user = nil
  end
end
