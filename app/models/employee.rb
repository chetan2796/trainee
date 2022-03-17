class Employee < ApplicationRecord
  
  has_secure_password
  require 'securerandom'
  attr_accessor :pass

  #Callbacks
  after_create :send_email
  before_validation :add_random_password

  # Enum
  enum gender: {female: 'female', male: 'male'}
  enum role: {teamlead: 'teamlead', admin: 'admin', trainees: 'trainees'}

  # Association
  has_many :topics
  belongs_to :mentor, :class_name => 'Employee', :foreign_key => 'mentor_id', optional: true

  #scope
  scope :search_values, -> (params) { where("name LIKE ? ", "%#{params[:search_key]}%")}

  def add_random_password
    self.pass = SecureRandom.alphanumeric
    self.password = self.pass 
    self.password_confirmation = self.pass
  end

  def send_email
    EmployeeMailer.employee_confirmation_email(email, pass).deliver
  end

end