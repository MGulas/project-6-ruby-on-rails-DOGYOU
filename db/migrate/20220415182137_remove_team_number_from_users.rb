class RemoveTeamNumberFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :team_number, :integer
  end
end
