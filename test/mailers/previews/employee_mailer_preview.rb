# Preview all emails at http://localhost:3000/rails/mailers/employee_mailer
class EmployeeMailerPreview < ActionMailer::Preview
  
  def employee_confirmation_email
    EmployeeMailer.employee_confirmation_email(Employee.new(email: 'bo@samurails.com'))
  end
end
