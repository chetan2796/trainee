class Employee < ApplicationRecord
  has_secure_password

  #Callbacks
  after_create :send_email
  
  # Enum
  enum gender: {female: 'female', male: 'male'}
  enum role: { teamlead: 'teamlead', admin: 'admin', trainees: 'trainees'}
  # enum mentors: [:user, :vip, :admin, :developer, :marketing, :support, :translator]

  # Association

  def send_email
    EmployeeMailer.employee_confirmation_email(email,password).deliver
  end

  def mentor
    Employee.find_by(id: mentor_id)
  end
end