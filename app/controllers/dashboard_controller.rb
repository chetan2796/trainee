class DashboardController < ApplicationController

  include SlackNotification
  require 'slack-notifier'

  before_action :require_user_logged_in!

  def index
    # @employee_trainees = Employee.trainees 
    if params[:search_key]
      @employee = Employee.search_values(params)
      @employee_trainees = Employee.trainees.search_values(params)
    else
      @employee = Employee.all
    end
  end

  def show
    @employee = Employee.find_by(params[:email])
  end

  def new
    @employee = Employee.new
  end

  def edit
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      slack_notify_to_support_employee(@employee.email,@employee.password)
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
    params.require(:employee).permit(:mentor_id, :name, :email, :role, :address, :gender)
  end
end



