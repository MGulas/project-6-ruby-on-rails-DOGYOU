class Course < ApplicationRecord
    has_and_belongs_to_many :users

    validates :course_id, presence: true
end
