# Preview all emails at http://localhost:3000/rails/mailers/attendance
class AttendancePreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/attendance/attendance_reminder
  def attendance_reminder
    AttendanceMailer.attendance_reminder
  end

end
