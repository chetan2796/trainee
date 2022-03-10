class Employee < ApplicationRecord
  has_secure_password
  require 'securerandom'

  #Callbacks
  after_create :send_email
  before_validation :add_random_password
  
  # Enum
  enum gender: {female: 'female', male: 'male'}
  enum role: { teamlead: 'teamlead', admin: 'admin', trainees: 'trainees'}
  
  # Association
  belongs_to :mentor, :class_name => 'Employee', :foreign_key => 'mentor_id'
  has_many :topics

  def send_email
    EmployeeMailer.employee_confirmation_email(email,password_digest).deliver
  end

  def add_random_password 
    self.password_digest = SecureRandom.alphanumeric
  end

end