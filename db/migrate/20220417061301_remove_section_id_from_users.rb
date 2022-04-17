class RemoveSectionIdFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :section_id, :integer
  end
end
