class ApplicationController < ActionController::Base
  before_action :set_current_employee

  def set_current_employee
    @current_user = Employee.find_by(id: session[:employee_id]) if session[:employee_id]
  end

  def require_user_logged_in!
    redirect_to sign_in_path, alert: 'You must be signed in' if  @current_user.nil?
  end
end
