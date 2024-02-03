class AddInternshipSupervisorToCompany < ActiveRecord::Migration[7.1]
  def change
    add_reference :companies, :internship_supervisor, null: false, foreign_key: true, type: :uuid
  end
end
