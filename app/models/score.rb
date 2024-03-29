class Score < ApplicationRecord
    belongs_to :project

    validates :creator, presence: true
    validates :recipient, presence: true
    validates :project, presence: true
end
