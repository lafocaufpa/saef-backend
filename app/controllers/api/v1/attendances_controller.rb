class Api::V1::AttendancesController < ApplicationController
  before_action :authenticate_api_trainee!, except:  [:index, :show]
  before_action :restrict_access, only: %i[create]
  before_action :set_attendance, only: %i[show update destroy]

  def index 
    @attendances =  Attendance.order(:day)

    render json: @attendances
  end

  def show 
    render json: @attendance
  end

  def create 
    @attendance = Attendance.new(attendance_params)
    if @attendance.save 
      render json: @attendance, status: :created
    else 
      render json: @attendance.errors, status: :unprocessable_entity
    end
  end

  def update 
    if @attendance.update(attendance_params)
      render json: @attendance
    else
      render json: @attendance.errors, status: :unprocessable_entity
    end
  end

  def destroy 
    @attendance.destroy
    head :no_content
  end

  private 
    def attendance_params
      params.permit(:day, :task_id)
    end
    
    def set_attendance
      @attendance = Attendance.find(params[:id])  
    end

    def restrict_access # Method to restrict access only to Fridays after 5 pm
      time = Time.now
      current_hour = time.hour
      weekday = time.wday

      unless weekday == 5 && current_hour >= 17
        render json: { message: 'A funcionalidade ainda não está disponível!' }, status: :unprocessable_entity
      end
    end
end
