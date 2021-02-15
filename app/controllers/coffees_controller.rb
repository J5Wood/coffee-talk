class CoffeesController < ApplicationController
    before_action :require_login
    before_action :find_coffee, only: [:edit, :update, :show, :destroy]

    def index
        @coffees = Coffee.all
    end

    def new
        @coffee = Coffee.new
        find_brands
        @coffee.build_brand
    end

    def create
        @coffee = Coffee.new(coffee_params)
        save_coffee
    end

    def edit
        find_brands
        @coffee_brand_id = @coffee.brand.id
        @coffee.build_brand
    end

    def update
        set_star_average
        @coffee.update(coffee_params)
        save_coffee
    end

    def show
        @reviews = @coffee.reviews
    end

    def destroy
        @coffee.destroy
        redirect_to coffees_path
    end

    private

    def find_coffee
        @coffee = Coffee.find_by(id: params[:id])
    end

    def find_brands
        @brands = Brand.all
    end

    def coffee_params
        params.require(:coffee).permit(:name, :roast, :origin, :notes, :stars, :brand_id, brand_attributes: [:name, :location])
    end

    def save_coffee
        if @coffee.save
            redirect_to coffee_path(@coffee)
        else
            find_brands
            @coffee.build_brand
            render :new
        end
    end

    def set_star_average
        if @coffee.reviews.any?
            star_sum = params[:coffee][:stars].to_i
            @coffee.reviews.each do |review|
                star_sum += review.stars
            end
            params[:coffee][:stars] = star_sum / (@coffee.reviews.count + 1)
        end
    end
end
