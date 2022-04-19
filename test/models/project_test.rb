require "test_helper"

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup 
    @project = Project.new(p_name: "test proj", p_number: 999)
  end

  test "should be valid" do
    assert @project.valid?
  end

  test "p_name should be present" do
    @project.p_name = "     "
    assert_not @project.valid?
  end

  test "p_number should be present" do
    @project.p_number = "     "
    assert_not @project.valid?
  end
end
