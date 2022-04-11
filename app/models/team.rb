class Team < ApplicationRecord
    has_and_belongs_to_many :users, :foreign_key => "team_number"

    validates :team_number, presence: true
    validates :section_id, presence: true
    validates :team_name, presence: true
end
