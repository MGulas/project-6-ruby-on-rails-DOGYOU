require "test_helper"

class TeamTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @team = Team.new(team_number: "999", section_id: "999", team_name: "TESTING TEAM")
  end

  test "should be valid" do
    assert @team.valid?
  end

  test "team number should be present" do
    @team.team_number = "     "
    assert_not @team.valid?
  end

  test "section id should be present" do
    @team.section_id = "     "
    assert_not @team.valid?
  end

  test "team name should be present" do
    @team.team_name = "     "
    assert_not @team.valid?
  end

end
