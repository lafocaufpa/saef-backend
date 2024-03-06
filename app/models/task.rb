class Task < ApplicationRecord
  belongs_to :internship_plan
  has_many :attendances, dependent: :destroy
  
  enum status: { 'Pendente': 0, 'Em andamento': 1, 'Concluida': 2 }

  validates :start_date, presence: true, start_date: { message: 'A Data Inicial não é válida' }
  validates :final_date, presence: true, final_date: { message: 'A Data Final não pode ser menor ou igual a Data Inicial' } 
  validates :description, presence: true
  validates :description, presence:  true#, length: { in: 0..2 } 

end
