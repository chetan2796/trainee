class Employee < ApplicationRecord
  has_secure_password
  enum gender: { female: 'female', male: 'male' }
  enum role: { admin: 'admin', teamlead: 'teamlead', trainees: 'trainees'  }
end