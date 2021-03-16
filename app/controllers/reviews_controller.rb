class ReviewsController < ApplicationController
    before_action :require_login
    before_action :find_review, only: [:edit, :update, :destroy]
    before_action :find_coffee, only: [:edit, :new]
    before_action :verify_review, only: [:edit, :update, :destroy]
    before_action :verify_coffee, only: [:edit, :new]

    def new
        @review = Review.new
    end

    def create
        @review = Review.new(review_params)
        @review.user_id = session[:user_id]
        if @review.save
            @review.coffee.update_stars
            redirect_to coffee_path(@review.coffee)
        else
            @coffee = Coffee.find_by(id: params[:review][:coffee_id])
            render :new
        end
    end

    def edit
        verify_correct_review
    end

    def update
        if @review.update(review_params)
            @review.coffee.update_stars
            redirect_to coffee_path(@review.coffee)
        else
            @coffee = Coffee.find_by(id: params[:review][:coffee_id])
            render :edit
        end 
    end

    def destroy
        @review.destroy
        @review.coffee.update_stars
        redirect_to coffee_path(@review.coffee)
    end

    private

    def find_coffee
        @coffee = Coffee.find_by(id: params[:coffee_id])
    end

    def verify_coffee
        if !@coffee
            redirect_to coffees_path
        end
    end

    def find_review
        @review = Review.find_by(id: params[:id])
    end

    def verify_review
        if !@review
            redirect_to coffees_path
        end
    end

    def verify_correct_review
        if @review.user_id != session[:user_id] || @review.coffee_id != params[:coffee_id].to_i
            redirect_to coffee_path(@coffee)
        end
    end

    def review_params
        params.require(:review).permit(:content, :coffee_id, :stars)
    end

end
