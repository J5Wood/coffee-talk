class ReviewsController < ApplicationController
    before_action :require_login
    before_action :find_review, only: [:edit, :update]
    before_action :find_coffee, only: [:edit, :new]

    def new
        @review = Review.new
    end

    def create
        @review = Review.new(review_params)
        @review.user_id = session[:user_id]
        if @review.save
            redirect_to coffee_path(@review.coffee)
        else
            @coffee = Coffee.find_by(id: params[:review][:coffee_id])
            render :new
        end
    end

    def edit
    end

    def update
        if @review.update(review_params)
            redirect_to coffee_path(@review.coffee)
        else
            @coffee = Coffee.find_by(id: params[:review][:coffee_id])
            render :edit
        end 
    end

    private

    def find_coffee
        @coffee = Coffee.find_by(id: params[:coffee_id])
    end

    def find_review
        @review = Review.find_by(id: params[:id])
    end

    def review_params
        params.require(:review).permit(:content, :coffee_id)
    end

end
