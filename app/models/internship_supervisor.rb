# frozen_string_literal: true
class InternshipSupervisor < ActiveRecord::Base
  belongs_to :company
  has_one :internship_plan

  validates :name, presence: true 
  validates :cpf, presence: true, length: { is: 11 }#, cpf: { message: 'não é válido' }
  validates :email, presence: true, uniqueness: { case_sensitive: true }
  validates :password, presence: true
  validates :function, presence: true

  # Include default devise modules. Others available are:
  # :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :confirmable, :trackable, :lockable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
end
