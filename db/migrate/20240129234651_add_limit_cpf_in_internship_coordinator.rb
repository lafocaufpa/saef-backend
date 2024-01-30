class AddLimitCpfInInternshipCoordinator < ActiveRecord::Migration[7.1]
  def change
    change_column :internship_coordinators, :cpf, :string, limit: 11, null: false
  end
end
