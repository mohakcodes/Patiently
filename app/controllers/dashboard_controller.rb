class DashboardController < ApplicationController
  before_action :set_current_user

  def index
    @patients = Patient.all
    @patient = Patient.new

    if @current_user.role == "doctor"
      @patients_per_day = Patient.registrations_per_day
    end
  end

  private

  def set_current_user
    @current_user = User.find(session[:user_id])
  end
end
