class Dashboard::PatientsController < ApplicationController
    before_action :check_receptionist_permission
    before_action :set_patient, only: [:edit, :update, :destroy]
  
    def create
      @patient = Patient.new(patient_params)
      if @patient.save
        redirect_to dashboard_path, notice: 'Patient created successfully.'
      else
        @current_user = User.find(session[:user_id])
        @patients = Patient.all
        render 'dashboard/index'
      end
    end
  
    def edit
    end
  
    def update
      if patient_params.values.any?(&:blank?)
        redirect_to dashboard_path, alert: 'Please fill in all fields.'
      elsif @patient.update(patient_params)
        redirect_to dashboard_path, notice: 'Patient updated successfully.'
      else
        render 'dashboard/index'
      end
    end
    
  
    def destroy
      @patient.soft_delete
      redirect_to dashboard_path, notice: 'Patient deleted successfully.'
    end
  
    private
  
    def set_patient
      @patient = Patient.find(params[:id])
    end
  
    def patient_params
      params.require(:patient).permit(:name, :age, :gender, :contact_info, :medical_history)
    end
  
    def check_receptionist_permission
      @current_user = User.find(session[:user_id])
      unless @current_user.role == 'receptionist'
        redirect_to dashboard_path, alert: 'Permission denied.'
      end
    end
end