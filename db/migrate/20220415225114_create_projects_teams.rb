class CreateProjectsTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :projects_teams do |t|

      t.timestamps
    end
  end
end
