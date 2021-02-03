class User < ApplicationRecord
    has_many :reviews
    has_many :coffees, through: :reviews
    has_secure_password
    validates :name, :password, :email, presence: true
end
