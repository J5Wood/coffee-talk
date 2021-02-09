class Brand < ApplicationRecord
    has_many :coffees, dependent: :destroy
    has_many :reviews, through: :coffees
    validates :name, presence: true
    validates :name, uniqueness: true

    def average_rating
        if coffees.any?
            star_array = []
            coffees.each do |coffee|
                star_array << coffee.stars
            end
            average = star_array.sum(0.0) / star_array.size
            average = average.to_i
        else
            0
        end
    end

    def self.top_rated
        Brand.all.sort_by { |brand| brand.average_rating }[-5,5].reverse()
    end
end
