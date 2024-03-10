class AttendanceMailer < ApplicationMailer

  def attendance_reminder(trainee)
    @trainee = trainee 

    mail to: @trainee.email, subject: 'Cadastrar Frequência'
  end

  def notify_attendance_registration(internship_supervisor)
    @internship_supervisor = internship_supervisor

    mail to: @internship_supervisor.email, subject: 'Frequência do Estagiário Cadastrada'
  end

  def notify_completion_of_internship(internship_supervisor)
    @internship_supervisor = internship_supervisor

    mail to: @internship_supervisor.email, subject: 'Estágio Concluído'
  end
end
