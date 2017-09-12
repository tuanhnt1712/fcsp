class AddTeamToJob < ActiveRecord::Migration[5.0]
  def change
    add_reference :jobs, foreign_key: true
  end
end
