require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @team = Team.new(team_number: 999)
    @user = User.new(email_address: "user@example.com", first_name: "Hunter", last_name: "Mills", team_number: 999)
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "first and last name should be present" do
    @user.first_name = "     "
    @user.last_name = "     "
    assert_not @user.valid?
  end

  test "email address should be present" do
    @user.email_address = "     "
    assert_not @user.valid?
  end

end
