class Coffee < ApplicationRecord
    belongs_to :brand
    has_many :reviews
    has_many :users, through: :reviews
    validates :name, :roast, :stars, presence: true
    validates :roast, :stars, format: { with: /[12345]/, message: "only allows numbers 1 to 5" }
    validates :roast, :stars, length: { is: 1, message: "only allows numbers 1 to 5" }

    def brand_attributes=(attr)
        if !attr[:name].blank?
            self.brand = Brand.find_or_create_by(name: attr[:name], location: attr[:location])
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
end
