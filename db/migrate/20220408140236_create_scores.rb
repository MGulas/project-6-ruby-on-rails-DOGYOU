class CreateScores < ActiveRecord::Migration[6.1]
  def change
    create_table :scores do |t|
      t.string :creator
      t.string :recipient
      t.integer :project_id
      t.integer :score

      t.timestamps
    end
  end
end
