class Brand < ApplicationRecord
    has_many :coffees
    has_many :reviews, through: :coffees
    validates :name, presence: true
    validates :name, uniqueness: true
end
