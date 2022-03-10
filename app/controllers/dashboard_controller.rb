class DashboardController < ApplicationController

  before_action :require_user_logged_in!
  require 'securerandom'

  def index
    @employee_trainees = Employee.where(role: "trainees")
    if params[:search_key]
      @employee = Employee.where("name LIKE ? ", 
      "%#{params[:search_key]}%")
    else
      @employee = Employee.all
    end
  
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
    if @employee.save 
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
    if @employee.update(employee_params)
      redirect_to edit_employee(@employee), notice: "Topic was successfully updated."
    else
      render :edit, status: :unprocessable_entity 
    end
  end

  private

  def employee_params
    params.require(:employee).permit(:mentor_id,:name, :email, :role, :address, :gender)
  end
end



