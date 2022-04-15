class Course < ApplicationRecord
    validates :section_id, presence: true
end
