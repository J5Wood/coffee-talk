class BrandsController < ApplicationController

    def index
        @brands = Brand.all
    end

    def new
        @brand = Brand.new
    end

    def create
        @brand = Brand.new(brand_params)
        if @brand.save
            redirect_to brand_path(@brand)
        else
            render :new
        end
    end

    def edit
        @brand = Brand.find_by(id: params[:id])
    end

    def update
        @brand = Brand.find_by(id: params[:id])
        if @brand.update(brand_params)
            redirect_to brand_path(@brand)
        else
            render :edit
        end
    end

    def show
        @brand = Brand.find_by(id: params[:id])
    end

    private

    def brand_params
        params.require(:brand).permit(:name, :location)
    end
end
