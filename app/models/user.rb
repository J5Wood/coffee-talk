class User < ApplicationRecord
    has_many :reviews
    has_many :coffees, through: :reviews
    has_secure_password
end
