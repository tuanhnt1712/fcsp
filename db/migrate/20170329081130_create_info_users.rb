class CreateInfoUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :info_users do |t|
      t.integer :relationship_status, default: 0, null: false
      t.text :introduce
      t.string :quote
      t.string :ambition
      t.string :phone
      t.string :address
      t.integer :gender, default: 0, null: false
      t.datetime :birthday
      t.string :occupation
      t.string :country
      t.boolean :is_public, default: false
      t.references :user, index: true, unique: true, foreign_key: true
      t.timestamps
    end
  end
end
