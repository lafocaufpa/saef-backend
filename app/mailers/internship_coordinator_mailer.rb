class InternshipCoordinatorMailer < ApplicationMailer
  def notify_new_user(internship_coordinator)
    @internship_coordinator = internship_coordinator
    mail to: @internship_coordinator.email, subject: 'Novo usuário cadastrado no SAEF'
  end

  def notify_user_validation(user)
    @user = user
    mail to: @user.email, subject: 'Atualização da sua conta do SAEF'
  end
end
