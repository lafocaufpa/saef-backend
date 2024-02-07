class Api::V1::TasksController < ApplicationController
  before_action :set_internship_plan
  before_action :set_task, only: %i[show update destroy]

  def index 
    @tasks = @internship_plan.tasks.order(:created_at)
    
    render json: @tasks
  end

  def show 
    render json: @task 
  end

  def create 
    @task = @internship_plan.tasks.build(task_params)
    if @task.save 
      render json: @task, status: :created 
    else 
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def update
    if @task.update(task_params)
      render json: @task 
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy 

    render json: { message: 'Tarefa excluída com sucesso!' }
  end

  private 
    def task_params
      params.permit(:start_date, :final_date, :description, :status, :internship_plan_id)
    end

    def set_task
      @task = @internship_plan.tasks.find(params[:id])
    end

    def set_internship_plan
      @internship_plan = InternshipPlan.find(params[:internship_plan_id])
    end
end
