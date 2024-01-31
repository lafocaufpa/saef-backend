# frozen_string_literal: true
class InternshipSupervisor < ActiveRecord::Base
  belongs_to :company
  has_one :internship_plan

  validates :name, presence: true 
  validates :cpf, presence: true, length: { is: 11 }#, cpf: { message: 'não é válido' }
  validates :function, presence: true

  # Include default devise modules. Others available are:
  #:timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :lockable, :validatable
  include DeviseTokenAuth::Concerns::User

  before_validation :set_uid 

  private 
    def set_uid 
      self[:uid] = self[:email] if self[:uid].blank? && self[:email].present?
    end
end
