class WelcomeController < ApplicationController

    def home
        @coffees = Coffee.top_rated
        @brands = Brand.top_rated
    end
end
