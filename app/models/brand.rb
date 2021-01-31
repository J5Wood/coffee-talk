class Brand < ApplicationRecord
    has_many :coffees
    has_many :reviews, through: :coffees
end
