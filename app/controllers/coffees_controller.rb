class CoffeesController < ApplicationController

    def index
        @coffees = Coffee.all
    end

    def new
        @coffee = Coffee.new
    end

    def create
        @coffee = Coffee.new
    end

    def edit
        @coffee = Coffee.find_by(id: params[:id])
    end

    def update
        @coffee = Coffee.find_by(id: params[:id])
    end

    def show
        @coffee = Coffee.find_by(id: params[:id])
    end

    def delete
    end
end
