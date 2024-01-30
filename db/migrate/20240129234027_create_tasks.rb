class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks, id: :uuid do |t|
      t.date :start_date, null: false 
      t.date :final_date, null: false 
      t.text :description, null: false 
      t.boolean :status
      t.references :internship_plan, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
