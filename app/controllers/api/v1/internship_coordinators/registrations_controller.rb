class Api::V1::InternshipCoordinators::RegistrationsController < DeviseTokenAuth::RegistrationsController
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
      params.permit(:name, :cpf, :email, :password, :password_confirmation, :faculty)
    end

    def account_update_params
      params.permit(:name, :cpf, :email, :password, :faculty)
    end
end