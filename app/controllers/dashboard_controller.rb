class DashboardController < ApplicationController

  before_action :require_user_logged_in!
  require 'securerandom'

  def index
    @employee = Employee.all
  end

  def show
  end

  def new
    @employee = Employee.new
  end

  def edit
  end

  def create
    @employee = Employee.new(employee_params)
    @employee.password_digest = SecureRandom.alphanumeric
    if @employee.save
      # EmployeeMailer.with(email: @employee.email, password: @employee.password_digest).employee_confirmation_email.deliver_now
      redirect_to dashboards_path
    else
      render :new
    end
  end

  def destroy
    @employee = Employee.find_by(params[:email])
    @employee.destroy
    redirect_to dashboards_path
  end

  def update
    @employee = Employee.find_by(params[:email])
    @employee.update
  end

  private

  def employee_params
    params.require(:employee).permit(:mentor_id,:name, :email, :role, :address, :gender)
  end

  def required_login!
    @employee = Employee.find_by(params[:email])
  end
end

