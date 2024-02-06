class InternshipPlan < ApplicationRecord
  belongs_to :trainee
  belongs_to :internship_supervisor
  has_many :tasks 
  has_one :final_report 

  validates :title, presence: true
  validates :general_objective, presence: true
  validates :specific_objective, presence: true 
  validates :start_date, presence: true, start_date: { message: 'A Data Inicial não é válida' }
  validates :final_date, presence: true, final_date: { message: 'A Data Final não pode ser menor ou igual a Data Inicial' }
  validates :expected_result, presence: true
  validates :workload, presence: true 
end
