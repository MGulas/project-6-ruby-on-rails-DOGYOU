class AddCourseNameToCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :course_name, :string
  end
end
