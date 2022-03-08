class EmployeeMailer < ApplicationMailer
  default from: "employee@gmail.com"

  def employee_confirmation_email(email,password)
    # @employee = employee
    @email = email
    @password = password

    mail(to: @email, subject: 'your mailer is on the way!')
  end 
end
