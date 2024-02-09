class Api::V1::FinalReportsController < ApplicationController
  before_action :authenticate_api_internship_supervisor!, except: [:index, :show]
  before_action :set_internship_plan
  before_action :set_final_report, only: %i[show update destroy]

  def index 
    @final_report = @internship_plan.final_report

    render json: @final_report
  end 
  
  def show 
    render json: @final_report
  end

  def create
    @final_report = @internship_plan.build_final_report(final_report_params)
    if @final_report.save  
      render json: @final_report, status: :created 
    else 
      render json: @final_report.errors, status: :unprocessable_entity
    end
  end

  def update 
    if @final_report.update(final_report_params)
      render json: @final_report
    else 
      render json: @final_report.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @final_report.destroy

    render json: { message: 'Tarefa excluída com sucesso!' }
  end

  private 
    def final_report_params
      params.permit(:effective_workload, :note, :applied_technique, :general_assessment, :professional_experience, :verifed_status, :status_concept)
    end

    def set_final_report 
      @final_report = @internship_plan.final_report
    end

    def set_internship_plan
      @internship_plan = InternshipPlan.find(params[:internship_plan_id])
    end
end
