class WelcomeController < ApplicationController

    def home
        @coffees = Coffee.order(stars: :desc).limit(5)
        @brands = Brand.top_rated
    end
end
