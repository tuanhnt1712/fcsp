class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :website
      t.text :introduction
      t.string :founder
      t.string :country
      t.integer :company_size
      t.date :founder_on
      t.integer :avatar_id
      t.integer :cover_image_id
      t.integer :creator_id

      t.timestamps
    end

    add_index :companies, :creator_id
    add_index :companies, :name
    add_index :companies, :website
    add_index :companies, [:avatar_id, :cover_image_id], unique: true
  end
end
