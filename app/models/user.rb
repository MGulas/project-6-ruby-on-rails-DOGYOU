class User < ApplicationRecord
    belongs_to :team, :foreign_key => "team_number"
end
