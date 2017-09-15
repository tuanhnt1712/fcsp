class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.integer :subject_id
      t.string :name
      t.string :description
      t.string :status
      t.integer :type
      t.timestamps
    end
  end
end
