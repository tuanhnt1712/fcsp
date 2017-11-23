class CreateShareProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :share_profiles do |t|
      t.integer :user_share_id
      t.integer :user_shared_id

      t.timestamps
    end

    add_index :share_profiles, :user_share_id
    add_index :share_profiles, :user_shared_id
    add_index :share_profiles, [:user_shared_id, :user_share_id], unique: true
  end
end
