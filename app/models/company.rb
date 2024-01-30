class Company < ApplicationRecord
  has_one :internship_supervisor

  validates :name, presence: true 
  validates :activity_branch, presence: true 
  validates :company_organization, presence: true 
  validates :cnpj, presence: true, length: { is: 14 }#, cnpj: { message: 'CNPJ não é válido' }  
end
