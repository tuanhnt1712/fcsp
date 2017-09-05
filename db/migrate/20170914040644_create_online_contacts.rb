class CreateOnlineContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :online_contacts do |t|
      t.integer :user_id
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
