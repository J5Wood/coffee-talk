class CoffeesController < ApplicationController
    before_action :require_login

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
        if @coffee.save
            redirect_to coffee_path(@coffee)
        else
            render :new
        end
    end

    def edit
        find_coffee
        find_brands
    end

    def update
        find_coffee
        @coffee.update(coffee_params)
        if @coffee.save
            redirect_to coffee_path(@coffee)
        else
            find_brands
            render :edit
        end
    end

    def show
        find_coffee
        @reviews = @coffee.reviews
    end

    def destroy
        find_coffee.destroy
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
end
