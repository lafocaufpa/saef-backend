class CreateCompanies < ActiveRecord::Migration[7.1]
  def change
    create_table :companies, id: :uuid do |t|
      t.string :name, null: false
      t.string :site
      t.string :activity_branch, null: false 
      t.string :company_organization, null: false 
      t.string :cnpj, limit: 14, null: false 

      t.timestamps
    end
    add_index :companies, :cnpj, unique: true
  end
end
