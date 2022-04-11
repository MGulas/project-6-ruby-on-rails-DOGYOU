class CreateTeamsUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :teams_users do |t|
      t.integer :team_number
      t.timestamps
    end
  end
end
