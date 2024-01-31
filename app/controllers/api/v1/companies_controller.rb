class Api::V1::CompaniesController < ApplicationController
  before_action :set_company, only: %i[show update destroy]
  
  # Method index to list companies
  def index  
    @companies = Company.order(:name)

    render json: @companies
  end
  # Action to list a company
  def show 
    render json: @company
  end
  # Method for creating a new company
  def create 
    @company = Company.new(company_params)
    if @company.save
      render json: @company, status: :created  
    else 
      render json: @company.errors, status: :unprocessable_entity
    end 
  end
  # Action to update a company
  def update 
    if @company.update(company_params)
      render json: @company
    else 
      render json: @company.errors, status: :unprocessable_entity
    end
  end
  # Action to destroy a company
  def destroy 
    @company.destroy 

    render json: @company.name
  end

  private 
    def set_company
      @company = Company.find(params[:id])
    end

    def company_params 
      params.permit(:name, :site, :activity_branch, :company_organization, :cnpj)
    end
end
