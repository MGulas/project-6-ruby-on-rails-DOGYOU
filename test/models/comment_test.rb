require "test_helper"

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @project = Project.new(p_name: "test proj", p_number: 999)
    @comment = Comment.new(creator: "creator@email.com", recipient: "recipient@email.com", project_id: 999, comment: "comment")
    @comment.project = @project
  end

  test "should be valid" do
    assert @comment.valid?
  end

  test "creator should be present" do
    @comment.creator = "     "
    assert_not @comment.valid?
  end

  test "recipient should be present" do
    @comment.recipient = "     "
    assert_not @comment.valid?
  end

  test "project should be present" do
    @comment.project = nil
    assert_not @comment.valid?
  end

  test "comment should be present" do
    @comment.comment = "     "
    assert_not @comment.valid?
  end
end
