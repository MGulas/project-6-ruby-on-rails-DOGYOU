class CreateProjectsTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :projects_teams do |t|
      t.belongs_to :project
      t.belongs_to :team
    end
  end
end
