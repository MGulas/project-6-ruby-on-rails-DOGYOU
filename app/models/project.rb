class Project < ApplicationRecord
    has_and_belongs_to_many :courses
    has_many :scores
    has_many :comments
    has_and_belongs_to_many :teams

    validates :p_number, presence: true, uniqueness: true
    validates :p_name, presence: true
end
