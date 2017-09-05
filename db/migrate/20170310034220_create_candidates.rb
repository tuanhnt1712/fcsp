class CreateCandidates < ActiveRecord::Migration[5.0]
  def change
    create_table :candidates do |t|
      t.references :user
      t.references :job
      t.integer :interested_in, default: 0
      t.integer :process, default: 0
      t.integer :candidates_count, default: 0

      t.timestamps
    end

    add_index :candidates, [:user_id, :job_id], unique: true
  end
end
