class FinalReport < ApplicationRecord
  belongs_to :internship_plan

  validates :effective_workload, presence: true 
  validates :note, presence: true 
  validates :applied_technique, presence: true 
  validates :general_assessment, presence: true
  validates :professional_experience, presence: true 
end
