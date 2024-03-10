class Api::V1::InternshipPlansController < ApplicationController
  before_action :authenticate_api_internship_supervisor!
  before_action :set_internship_plan, only: %i[show update destroy]
  
  def index 
    @internship_plans = current_api_internship_supervisor.internship_plan

    render json: @internship_plans
  end

  def show 
    render json: @internship_plan
  end
  
  def create 
    @internship_plan = current_api_internship_supervisor.build_internship_plan(internship_plan_params)    
    if @internship_plan.save 
      render json: @internship_plan, status: :created
    else
      render json:@internship_plan.errors, status: :unprocessable_entity
    end
  end

  def update 
    if @internship_plan.update(internship_plan_params)
      render json: @internship_plan
    else
      render json: @internship_plan.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @internship_plan.destroy 
    
    render json: @internship_plan.title 
  end

  private 
    def set_internship_plan
      set_internship_plan = InternshipPlan.find(params[:id])
      @internship_plan = set_internship_plan.internship_supervisor

      @internship_plan = set_internship_plan if @internship_plan.present?
    end

    def internship_plan_params
      params.permit(:title, :general_objective, :specific_objective, :start_date, :final_date, :expected_result, :workload, :status_concept, :trainee_id)
    end
end
