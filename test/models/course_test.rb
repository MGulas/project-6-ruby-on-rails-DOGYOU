require "test_helper"

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @course = Course.new(course_id: 1, course_name: "test course")
  end

  test "should be valid" do
    assert @course.valid?
  end

  test "course_id should be present" do
    @course.course_id = "     "
    assert_not @course.valid?
  end

  test "course_name should be present" do
    @course.course_name = "     "
    assert_not @course.valid?
  end
end
