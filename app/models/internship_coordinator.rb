# frozen_string_literal: true
class InternshipCoordinator < ActiveRecord::Base
  has_many :trainees 

  validates :name, presence: true 
  validates :cpf, presence: true, length: { is: 11 }#, cpf: { message: 'não é válido' }
  validates :faculty, presence: true 

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
