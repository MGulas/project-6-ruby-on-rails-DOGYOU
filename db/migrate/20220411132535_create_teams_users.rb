class CreateTeamsUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :teams_users do |t|

      t.timestamps
    end
  end
end
