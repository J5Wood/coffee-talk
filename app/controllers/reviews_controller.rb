class ReviewsController < ApplicationController
    before_action :require_login

    def new
        @review = Review.new
        find_coffee
    end

    def create
        @review = Review.new(review_params)
        @review.user_id = session[:user_id]
        if @review.save
            redirect_to coffee_path(@review.coffee)
        else
            @coffee =  Coffee.find_by(id: params[:review][:coffee_id])
            render :new
        end
    end

    def edit
        find_review
        find_coffee
    end

    def update
        find_review
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
