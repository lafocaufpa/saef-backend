class Api::V1::Trainees::SessionsController < DeviseTokenAuth::SessionsController
  
  def create
    if valid_unlock?
      super
    else
      render json: {errors: ['Seu login ainda não foi aprovado!']}, status: :unauthorized
    end
  end

  def valid_unlock?
    Trainee.find_by(email: params[:email]).is_actived?
  end
end