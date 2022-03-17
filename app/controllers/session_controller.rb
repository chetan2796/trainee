class SessionController < ApplicationController

  def new
  end

  def create
    employee = Employee.find_by(email: params[:email])
    if employee.present? && employee.authenticate(params[:password])
      session[:employee_id] = employee.id
      if employee.trainees?
        redirect_to topics_path, notice: 'trainees Logged in sccessfully ' 
      elsif employee.admin?
        redirect_to dashboards_path, notice: 'admin Logged in sccessfully '
      elsif employee.teamlead?
        redirect_to dashboards_path, notice: 'teamlead Logged in sccessfully '
      end
    else
      flash[:alert] = "Invalid email and password"
      render :new
    end
  end

  def destroy
    session[:employee_id] = nil
    redirect_to root_path, notice: 'Logged out successfully'
  end
end