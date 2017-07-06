class AddCreateByAndCompanyId < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :company_id, :integer
    add_column :companies, :creator_id, :integer
    add_index :companies, :creator_id
  end
end
