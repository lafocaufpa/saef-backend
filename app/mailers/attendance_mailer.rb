class AttendanceMailer < ApplicationMailer

  def attendance_reminder(trainee)
    @trainee = trainee 

    mail to: @trainee.email, subject: 'Cadastrar Frequência'
  end
end
