class Project < ApplicationRecord
    belongs_to :course

    has_many :scores
    has_many :comments
    has_many :teams

    validates :p_number, presence: true
    validates :p_name, presence: true
end
