class CreateInternshipPlans < ActiveRecord::Migration[7.1]
  def change
    create_table :internship_plans, id: :uuid do |t|
      t.string :title, null: false
      t.text :general_objective, null: false
      t.text :specific_objective, null: false
      t.date :start_date, null: false
      t.date :final_date, null: false
      t.string :expected_result, null: false
      t.integer :workload, null: false
      t.boolean :status_concept
      t.references :trainee, null: false, foreign_key: true, type: :uuid
      t.references :internship_supervisor, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
