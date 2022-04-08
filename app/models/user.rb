class User < ApplicationRecord
    belongs_to :team, :foreign_key => "team_number"

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email_address, presence: true
end
