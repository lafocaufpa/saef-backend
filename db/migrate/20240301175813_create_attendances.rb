class CreateAttendances < ActiveRecord::Migration[7.1]
  def change
    create_table :attendances, id: :uuid do |t|
      t.date :day, null: false 
      t.references :task, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
