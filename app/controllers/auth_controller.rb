class AuthController < ApplicationController
  skip_before_action :require_login, only: [:login, :signup, :create_session, :create_user]

  def login
  end

  def signup
  end

  def create_session
    email = params[:user][:email]
    password = params[:user][:password]
    user = User.find_by(email: email)
    if user && user.authenticate(password) 
      session[:user_id] = user.id
      Rails.logger.info "User logged in successfully: #{user.id}"
      redirect_to dashboard_path, notice: 'Logged in successfully'
    else
      flash.now[:alert] = 'Invalid email or password'
      render :login
    end
  end
  

  def create_user
    user = User.new(user_params)
    if user.save
      reset_session
      session[:user_id] = user.id
      redirect_to dashboard_path, notice: 'Account created successfully'
    else
      flash.now[:alert] = user.errors.full_messages.join(', ')
      render :signup
    end
  end

  def logout
    reset_session
    redirect_to auth_login_path, notice: 'Logged out successfully'
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :role)
  end
end
