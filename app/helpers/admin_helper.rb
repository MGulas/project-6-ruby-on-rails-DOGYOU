module AdminHelper

    def add_to_team(user, team)
        user.teams << team
    end
end
