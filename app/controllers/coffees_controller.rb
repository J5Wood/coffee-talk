class CoffeesController < ApplicationController

    def index
        @coffees = Coffee.all
    end

    def new
        @coffee = Coffee.new
        @brands = Brand.all
    end

    def create
        if brand = Brand.find_by(id: params[:coffee][:brand_id])
            @coffee = brand.coffees.build(coffee_params)
        else
            @coffee = Coffee.new(coffee_params)
        end
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
        if brand = Brand.find_by(id: params[:coffee][:brand_id])
            @coffee.update(coffee_params)
            @coffee.brand_id = brand.id
        else
            @coffee.update(coffee_params)
        end
        if @coffee.save
            redirect_to coffee_path(@coffee)
        else
            render :edit
        end
    end

    def show
        @coffee = Coffee.find_by(id: params[:id])
    end

    def delete
    end

    private

    def coffee_params
        params.require(:coffee).permit(:name, :roast, :origin, :notes, :stars, :brand_id, brand_attributes: [:name, :location])
    end

end
