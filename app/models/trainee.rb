# frozen_string_literal: true
class Trainee < ActiveRecord::Base
  belongs_to :internship_coordinator
  has_one :internship_plan

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  validates :name, presence: true 
  validates :cpf, presence: true, length: { is: 11 }#, cpf: { message: 'não é válido' }
  validates :email, presence: true, uniqueness: {case_sensitive: true }
  validates :password, presence: true
  validates :class_room, presence: true 
  validates :conclusion_year, presence: true 
  validates :studentId_number, presence: true 
end
