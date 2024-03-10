class Attendance < ApplicationRecord
  belongs_to :task

  validates :day, presence: true, attendance_day: { message: 'O dia não é válido, está fora do intervalo do Plano de Estágio!'}
  
  after_create :notify_attendance_registration_email

  private 
    def notify_attendance_registration_email
      AttendanceMailer.notify_attendance_registration(self.task.internship_plan.internship_supervisor).deliver_later
    end
end
