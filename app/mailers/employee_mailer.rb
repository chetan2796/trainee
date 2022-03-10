class EmployeeMailer < ApplicationMailer
  default from: "employee@gmail.com"

  def employee_confirmation_email(email,password_digest)
    @email = email
    @password_digest = password_digest

    mail(to: @email, subject: 'your mailer is on the way!')
  end 
end
