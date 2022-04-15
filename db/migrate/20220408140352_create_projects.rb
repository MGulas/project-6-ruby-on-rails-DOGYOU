class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.integer :project_id
      t.integer :p_number
      t.string :p_name

      t.timestamps
    end
  end
end
