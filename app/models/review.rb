class Review < ApplicationRecord
    belongs_to :user
    belongs_to :coffee
    validates :content, presence: true
end
