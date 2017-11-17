class AddIntroductionInfoUser < ActiveRecord::Migration[5.0]
  def change
    add_column :info_users, :introduction, :string
  end
end
