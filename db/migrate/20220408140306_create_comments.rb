class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :creator
      t.string :recipient
      t.integer :project_id
      t.text :comment

      t.timestamps
    end
  end
end
