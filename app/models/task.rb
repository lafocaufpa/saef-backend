class Task < ApplicationRecord
  belongs_to :internship_plan

  validates :start_date, presence: true 
  validates :final_date, presence: true 
  validates :description, presence: true 
end
