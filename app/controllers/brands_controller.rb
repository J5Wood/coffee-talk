class BrandsController < ApplicationController
    before_action :require_login
    before_action :find_brand, only: [:edit, :update, :show, :destroy]

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
    end

    def update
        if @brand.update(brand_params)
            redirect_to brand_path(@brand)
        else
            render :edit
        end
    end

    def show
        @coffees = @brand.coffees
    end

    def destroy
        @brand.destroy
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
