# frozen_string_literal: true
class Trainee < ActiveRecord::Base
  belongs_to :internship_coordinator
  has_one :internship_plan
  
  validates :name, presence: true 
  validates :cpf, presence: true, length: { is: 11 }#, cpf: { message: 'não é válido' }
  validates :class_room, presence: true 
  validates :conclusion_year, presence: true 
  validates :studentId_number, presence: true 
  
  # Include default devise modules. Others available are:
  #:timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :lockable, :validatable
  include DeviseTokenAuth::Concerns::User


  before_validation :set_uid 
  after_create :notify_new_user_mail

  private 
    def set_uid 
      self[:uid] = self[:email] if self[:uid].blank? && self[:email].present?
    end

    def notify_new_user_mail
      InternshipCoordinatorMailer.notify_new_user(self.internship_coordinator).deliver_later
    end
end
