# frozen_string_literal: true
class InternshipCoordinator < ActiveRecord::Base
  has_many :trainees 

  validates :name, presence: true 
  validates :cpf, presence: true, length: { is: 11 }#, cpf: { message: 'não é válido' }
  validates :email, presence: true, uniqueness: {case_sensitive: true }
  validates :password, presence: true
  validates :faculty, presence: true 

  # Include default devise modules. Others available are:
  #:timeoutable,and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :lockable, :validatable
  include DeviseTokenAuth::Concerns::User
end
