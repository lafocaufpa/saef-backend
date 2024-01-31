class Api::V1::Trainees::RegistrationsController < DeviseTokenAuth::RegistrationsController
  before_action :sign_up_params, only: %i[create]
  before_action :account_update_params, only: %i[update]

  def create 
    super 
  end

  def update 
    super   
  end
  
  private
    def sign_up_params
      params.permit(:name, :cpf, :email, :password, :password_confirmation, :class_room, :conclusion_year, :studentId_number, :internship_coordinator_id)
    end

    def account_update_params
      params.permit(:name, :cpf, :email, :class_room, :conclusion_year, :studentId_number)
    end
end