class RenameIsActivedToTrainees < ActiveRecord::Migration[7.1]
  def change
    change_column :trainees, :is_actived, :boolean, default: false
  end
end
