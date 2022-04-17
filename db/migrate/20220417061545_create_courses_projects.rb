class CreateCoursesProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :courses_projects do |t|
      t.belongs_to :course
      t.belongs_to :project
    end
  end
end
