class Api::V1::InternshipCoordinators::InternshipCoordinatorsController < ApplicationController
  before_action :authenticate_api_internship_coordinator!, only: %i[index validate_user follow_internship_plan follow_final_report] 
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

  # Action to follow the internship plan
  def follow_internship_plan
    @trainees_plan_info = InternshipCoordinator.find(current_api_internship_coordinator.id).trainees.joins(:internship_plan)
                               .where(internship_plans: { status_concept: false })
                               .pluck('trainees.name', 'internship_plans.title', 'internship_plans.start_date', 'internship_plans.final_date')

    render json: @trainees_plan_info
  end

  # Action to follow the final report
  def follow_final_report
    @trainees_report_info = InternshipCoordinator.find(current_api_internship_coordinator.id).trainees.joins(internship_plan: :final_report)
                      .where(final_reports: { status_concept: false })
                      .pluck('trainees.name', 'final_reports.effective_workload', 'final_reports.note', 'final_reports.applied_technique', 'final_reports.general_assessment', 'final_reports.verifed_status')

    render json: @trainees_report_info
  end

  private
    def user_params
      params.permit(:is_actived)
    end

    def sending_mail(user)
      InternshipCoordinatorMailer.notify_user_validation(user).deliver_later
    end
end
