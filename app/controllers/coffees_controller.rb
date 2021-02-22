class CoffeesController < ApplicationController
    before_action :require_login
    before_action :find_coffee, only: [:edit, :update, :show, :destroy]
    before_action :verify_coffee, only: [:edit, :update, :show, :destroy]

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

    def verify_coffee
        if !@coffee
            redirect_to coffees_path
        end
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
end
