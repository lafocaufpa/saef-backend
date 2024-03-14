class Api::V1::FinalReportsController < ApplicationController
  before_action :authenticate_api_internship_supervisor!, except: [:index, :show]
  before_action :set_internship_plan
  before_action :valid_create_final_report, only: [:create]
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

    render json: { message: 'Relatório Final excluído com sucesso!' }
  end

  # Action to return the information to generate the final report PDF
  def generate_pdf_final_report 
    @internship_pdf_final_report = @internship_plan.final_report
    
    render json: {
      effective_workload: @internship_pdf_final_report.effective_workload,
      note: @internship_pdf_final_report.note,
      applied_technique: @internship_pdf_final_report.applied_technique,
      general_assessment: @internship_pdf_final_report.general_assessment,
      professional_experience: @internship_pdf_final_report.professional_experience,
    }
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

    def valid_create_final_report
      unless Date.today >= @internship_plan.final_date
        render json: { message: 'Você só poderá submeter o Relatório Final, somente após a data de término especificada no Plano de Estágio.' } 
      end
    end
end
