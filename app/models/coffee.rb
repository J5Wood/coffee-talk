class Coffee < ApplicationRecord
    belongs_to :brand
    has_many :reviews
    has_many :users, through: :reviews
    accepts_nested_attributes_for :brand
    validates :name, :roast, :stars, presence: true
    

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
end
