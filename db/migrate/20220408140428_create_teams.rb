class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.integer :team_number
      t.integer :section_id
      t.string :team_name
      t.integer :project_id

      t.timestamps
    end
  end
end
