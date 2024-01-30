class InternshipPlan < ApplicationRecord
  belongs_to :trainee
  belongs_to :internship_supervisor
  has_many :tasks 
  has_one :final_report 

  validates :title, presence: true
  validates :general_objective, presence: true
  validates :specific_objective, presence: true 
  validates :start_date, presence: true 
  validates :final_date, presence: true 
  validates :expected_result, presence: true
  validates :workload, presence: true 
end
