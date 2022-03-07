class SessionController < ApplicationController

  def new
  end

  def create
    employee = Employee.find_by(email: params[:email])
    if employee.present? 
      session[:employee_id] = employee.id
      redirect_to root_path, notice: 'Logged in sccessfully'
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