class RemoveStatusFromTasks < ActiveRecord::Migration[7.1]
  def change
    remove_column :tasks, :status, :boolean
  end
end
