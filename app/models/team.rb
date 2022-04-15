class Team < ApplicationRecord
    has_and_belongs_to_many :users
    has_and_belongs_to_many :projects

    validates :team_number, presence: true, uniqueness: true
    validates :section_id, presence: true
    validates :team_name, presence: true
end
