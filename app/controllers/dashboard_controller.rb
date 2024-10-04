class DashboardController < ApplicationController
  before_action :set_current_user
  
  def index
    @patients = Patient.all
    @patient = Patient.new
  end

  private

  def set_current_user
    @current_user = User.find(session[:user_id])
  end
end