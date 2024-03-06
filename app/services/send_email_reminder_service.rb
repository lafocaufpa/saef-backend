class SendEmailReminderService 
  def self.send_attendance_reminder
    trainees = Trainee.all.select { |trainee| trainee.internship_plan.present? && trainee.internship_plan.start_date <= Date.today && trainee.internship_plan.final_date >= Date.today }

    trainees.each do |trainee|
      AttendanceMailer.attendance_reminder(trainee).deliver_now
    end
  end
end