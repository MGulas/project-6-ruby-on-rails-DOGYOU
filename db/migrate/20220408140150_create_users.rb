class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email_address
      t.string :first_name
      t.string :last_name
      t.boolean :admin
      t.integer :section_id
      t.integer :team_number

      t.timestamps
    end
  end
end
