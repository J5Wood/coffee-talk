class Coffee < ApplicationRecord
    validates :name, presence: true
    belongs_to :brand
    accepts_nested_attributes_for :brand, reject_if: proc { |attributes| attributes['name'].blank? }
    validate :roast_validator
    validate :stars_validator
    has_many :reviews, dependent: :destroy
    has_many :users, through: :reviews

    
    def roast_validator
        if roast.blank? || !roast.to_s.match(/[12345]/) || roast.to_s.length != 1
            self.errors.add(:roast, 'Level Required')
        end
    end

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
