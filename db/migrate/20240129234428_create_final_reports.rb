class CreateFinalReports < ActiveRecord::Migration[7.1]
  def change
    create_table :final_reports, id: :uuid do |t|
      t.integer :effective_workload, null: false
      t.float :note, null: false
      t.string :applied_technique, null: false
      t.string :general_assessment, null: false
      t.string :professional_experience, null: false
      t.boolean :verifed_status
      t.boolean :status_concept
      t.references :internship_plan, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
