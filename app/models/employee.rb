class Employee < ApplicationRecord
  has_secure_password
  require 'securerandom'

  #Callbacks
  after_create :send_email
  before_validation :add_random_password
  
  # Enum
  enum gender: {female: 'female', male: 'male'}
  enum role: {teamlead: 'teamlead', admin: 'admin', trainees: 'trainees'}
  
  # Association
  has_many :topics
  belongs_to :mentor, :class_name => 'Employee', :foreign_key => 'mentor_id'

  #scope
  scope :search_values, -> (params) { where("name LIKE ? ", "%#{params[:search_key]}%")}

  def send_email
    EmployeeMailer.employee_confirmation_email(email,password_digest).deliver
  end

  def add_random_password 
    self.password_digest = SecureRandom.alphanumeric
  end

end