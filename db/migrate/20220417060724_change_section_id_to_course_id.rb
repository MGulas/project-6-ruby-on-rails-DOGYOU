class ChangeSectionIdToCourseId < ActiveRecord::Migration[6.1]
  def change
    rename_column :courses, :section_id, :course_id
  end
end
