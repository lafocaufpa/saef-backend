class RemoveCompanyFromInternshipSupervisors < ActiveRecord::Migration[7.1]
  def change
    remove_reference :internship_supervisors, :company, null: false, foreign_key: true, type: :uuid
  end
end
