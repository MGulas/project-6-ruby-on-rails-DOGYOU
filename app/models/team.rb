class Team < ApplicationRecord
    has_many :users, :foreign_key => "team_number"
end
