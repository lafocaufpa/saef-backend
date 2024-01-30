class DeviseTokenAuthCreateInternshipSupervisors < ActiveRecord::Migration[7.1]
  def change
    
    create_table(:internship_supervisors, id: :uuid) do |t|
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
      t.string :function, null: false
      t.references :company, null: false, foreign_key: true, type: :uuid 

      ## Tokens
      t.json :tokens

      t.timestamps
    end

    add_index :internship_supervisors, :email,                unique: true
    add_index :internship_supervisors, :cpf,                  unique: true
    add_index :internship_supervisors, [:uid, :provider],     unique: true
    add_index :internship_supervisors, :reset_password_token, unique: true
    add_index :internship_supervisors, :confirmation_token,   unique: true
    add_index :internship_supervisors, :unlock_token,         unique: true
  end
end
