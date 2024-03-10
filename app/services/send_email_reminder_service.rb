class SendEmailReminderService 
  def self.send_attendance_reminder
    trainees = Trainee.joins(:internship_plan)
                   .where("EXTRACT(DAY FROM internship_plans.start_date) <= ? 
                           AND EXTRACT(MONTH FROM internship_plans.start_date) <= ? 
                           AND EXTRACT(YEAR FROM internship_plans.start_date) <= ? 
                           AND EXTRACT(DAY FROM internship_plans.final_date) >= ? 
                           AND EXTRACT(MONTH FROM internship_plans.final_date) >= ? 
                           AND EXTRACT(YEAR FROM internship_plans.final_date) >= ?", 
                           Date.today.day, Date.today.month, Date.today.year,
                           Date.today.day, Date.today.month, Date.today.year)
                   .where.not(internship_plan: { id: nil })

    trainees.each do |trainee|
      AttendanceMailer.attendance_reminder(trainee).deliver_now
    end
  end

  def self.send_notify_completion_of_internship
    supervisors = InternshipSupervisor.joins(:internship_plan)
                   .where("EXTRACT(DAY FROM internship_plans.final_date) = ? 
                           AND EXTRACT(MONTH FROM internship_plans.final_date) = ? 
                           AND EXTRACT(YEAR FROM internship_plans.final_date) = ?", 
                           Date.today.day, Date.today.month, Date.today.year)
                   .where.not(internship_plan: nil)
    
    supervisors.each do |trainee|
      AttendanceMailer.notify_completion_of_internship(trainee).deliver_now
    end
  end
end