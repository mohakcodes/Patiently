class ApplicationController < ActionController::Base
  before_action :require_login

  private

  def require_login
    unless session[:user_id]
      redirect_to auth_login_path, alert: "You must be logged in to access this page"
    end
  end
end
