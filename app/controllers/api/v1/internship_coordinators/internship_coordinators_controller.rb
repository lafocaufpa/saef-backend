class Api::V1::InternshipCoordinators::InternshipCoordinatorsController < ApplicationController
  before_action :authenticate_api_internship_coordinator!, only: %i[index validate_user]
  # before_action :authenticate_api_trainee!, only: [:index]
  def index 
    @internship_coordinators = InternshipCoordinator.order(:name)

    render json: @internship_coordinators
  end

  def validate_user
    @user = current_api_internship_coordinator.trainees.find(params[:user_id])
    if @user.update(user_params)
      if @user.is_actived?
        render json: { message: 'Usuário aprovado com sucesso.' }
        sending_mail(@user) # Seding email to user
      else
        render json: { message: 'Usuário rejeitado com sucesso.' }
        sending_mail(@user) # Seding email to user
        # @user.destroy 
      end
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private
    def user_params
      params.permit(:is_actived)
    end

    def sending_mail(user)
      InternshipCoordinatorMailer.notify_user_validation(user).deliver_later
    end
end
