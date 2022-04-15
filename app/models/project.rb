class Project < ApplicationRecord
    has_many :scores
    has_many :comments
    has_many :teams

    validates :p_number, presence: true, uniqueness: true
    validates :p_name, presence: true
end
