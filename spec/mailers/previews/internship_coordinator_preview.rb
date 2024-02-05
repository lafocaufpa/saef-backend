# Preview all emails at http://localhost:3000/rails/mailers/internship_coordinator
class InternshipCoordinatorPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/internship_coordinator/notify_new_user
  def notify_new_user
    InternshipCoordinatorMailer.notify_new_user
  end

end
