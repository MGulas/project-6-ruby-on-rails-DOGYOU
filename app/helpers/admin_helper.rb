module AdminHelper

    def add_to_team(user, team)
        user.update_attribute(:team_number, team.team_number)
    end
end
