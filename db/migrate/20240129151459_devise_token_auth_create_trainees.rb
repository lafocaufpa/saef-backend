class DeviseTokenAuthCreateTrainees < ActiveRecord::Migration[7.1]
  def change

    create_table(:trainees, id: :uuid) do |t|
      ## Required
      t.string :provider, :null => false, :default => "email"
      t.string :uid, :null => false, :default => ""

      ## Database authenticatable
      t.string :encrypted_password, :null => false, :default => ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.boolean  :allow_password_change, :default => false

      ## Rememberable
      t.datetime :remember_created_at

      # Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet :current_sign_in_ip
      t.inet :last_sign_in_ip
      
      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      # Lockable
      t.integer  :failed_attempts, :default => 0, :null => false # Only if lock strategy is :failed_attempts
      t.string   :unlock_token # Only if unlock strategy is :email or :both
      t.datetime :locked_at

      ## User Info
      t.string :name, null: false
      t.string :cpf, limit: 11, null: false
      t.string :email, null: false
      t.integer :class_room, null: false
      t.integer :conclusion_year, null: false
      t.string :studentId_number, null: false
      t.boolean :is_actived
      t.references :internship_coordinator, null: false, foreign_key: true, type: :uuid

      ## Tokens
      t.json :tokens

      t.timestamps
    end

    add_index :trainees, :email,                unique: true
    add_index :trainees, :cpf,                  unique: true
    add_index :trainees, [:uid, :provider],     unique: true
    add_index :trainees, :reset_password_token, unique: true
    add_index :trainees, :confirmation_token,   unique: true
    add_index :trainees, :unlock_token,         unique: true
  end
end
