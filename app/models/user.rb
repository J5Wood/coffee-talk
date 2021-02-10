class User < ApplicationRecord
    has_many :reviews, dependent: :destroy
    has_many :coffees, through: :reviews
    has_secure_password
    validates :name, :password, presence: true
    validates :name, uniqueness: true
    validates :password, length: { minimum: 6 }
end
