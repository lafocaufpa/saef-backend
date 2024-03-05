class Attendance < ApplicationRecord
  belongs_to :task

  validates :day, presence: true, attendance_day: { message: 'O dia não é válido, está fora do intervalo do Plano de Estágio!'}
    
end
