class Comment < ApplicationRecord
    belongs_to :project

    validates :creator, presence: true
    validates :recipient, presence: true
    validates :project, presence: true
    validates :comment, presence: true
end
