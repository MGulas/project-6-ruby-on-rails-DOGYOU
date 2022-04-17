module AdminHelper

    def add_to_team(user, team)
        user.teams << team
        team.users << user
    end
end
