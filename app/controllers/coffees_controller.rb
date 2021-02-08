class CoffeesController < ApplicationController
    before_action :require_login

    def index
        @coffees = Coffee.all
    end

    def new
        @coffee = Coffee.new
        @brands = Brand.all
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
        @coffee = Coffee.find_by(id: params[:id])
        @brands = Brand.all
    end

    def update
        @coffee = Coffee.find_by(id: params[:id])
        @coffee.update(coffee_params)
        if @coffee.save
            redirect_to coffee_path(@coffee)
        else
            @brands = Brand.all
            render :edit
        end
    end

    def show
        @coffee = Coffee.find_by(id: params[:id])
        @reviews = @coffee.reviews
    end

    def destroy
        Coffee.find_by(id: params[:id]).destroy
        redirect_to coffees_path
    end

    private

    def coffee_params
        params.require(:coffee).permit(:name, :roast, :origin, :notes, :stars, :brand_id, brand_attributes: [:name, :location])
    end

end
