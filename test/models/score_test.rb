require "test_helper"

class ScoreTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @score = Score.new(creator: "me" , recipient: "you", project_id: 999, score: 1)
    @project = Project.new(p_name: "test proj", p_number: 999)
    @score.project = @project
  end

  test "should be valid" do
    assert @score.valid?
  end

  test "creator should be present" do
    @score.creator = "     "
    assert_not @score.valid?
  end

  test "recipient should be present" do
    @score.recipient = "     "
    assert_not @score.valid?
  end

  test "project should be present" do
    @score.project = nil
    assert_not @score.valid?
  end
end
