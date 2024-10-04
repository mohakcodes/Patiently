class DashboardController < ApplicationController
    def index
      unless session[:user_id]
        redirect_to auth_login_path, alert: 'Login to access this page'
      end
    end
end 