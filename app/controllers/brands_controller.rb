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
        find_brand
    end

    def update
        find_brand
        if @brand.update(brand_params)
            redirect_to brand_path(@brand)
        else
            render :edit
        end
    end

    def show
        find_brand
    end

    def destroy
        Brand.find_by(id: params[:id]).destroy
        redirect_to brands_path
    end

    private

    def brand_params
        params.require(:brand).permit(:name, :location)
    end

    def find_brand
        @brand = Brand.find_by(id: params[:id])
    end
end
