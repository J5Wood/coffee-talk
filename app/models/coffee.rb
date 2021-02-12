class Coffee < ApplicationRecord
    belongs_to :brand
    has_many :reviews, dependent: :destroy
    has_many :users, through: :reviews
    validates :name, :roast, :stars, presence: true
    validates :roast, :stars, format: { with: /[12345]/ }
    validates :roast, :stars, length: { is: 1 }
    accepts_nested_attributes_for :brand, reject_if: proc { |attributes| attributes['name'].blank? }

    def roast_level
        if roast == 1
            "Light"
        elsif roast == 2
            "Medium Light"
        elsif roast == 3
            "Medium"
        elsif roast == 4
            "Medium Dark"
        else
            "Dark"
        end
    end

    def user_reviews(user)
        reviews.where(user_id: user.id)
    end

    def self.top_rated
        order(stars: :desc).limit(5)
    end
end
