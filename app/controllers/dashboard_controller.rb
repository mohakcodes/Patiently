class DashboardController < ApplicationController
  before_action :set_current_user

  def index
    @patients = Patient.where(is_deleted: false)
    @patient = Patient.new

    if @current_user.role == "doctor"
      @patients_per_day = Patient.all.group_by_day(:created_at).count
      @existing_patients_per_day = Patient.where(is_deleted: false).group_by_day(:created_at).count
    end
  end

  private

  def set_current_user
    @current_user = User.find(session[:user_id])
  end
end
