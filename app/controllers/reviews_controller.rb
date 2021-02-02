class ReviewsController < ApplicationController


    def new
        @review = Review.new
        @coffee =  Coffee.find_by(id: params[:coffee_id])
    end

    def create
        @review = Review.new(review_params)
        @review.user_id = session[:user_id]
        if @review.save
            redirect_to coffee_path(@review.coffee)
        else
            @coffee =  Coffee.find_by(id: params[:coffee_id])
            redirect_to :new
        end
    end

    def edit
        @review = Review.find_by(id: params[:id])
        @coffee = Coffee.find_by(id: params[:coffee_id])
    end

    def update
        @review = Review.find_by(id: params[:id])
        if @review.update(review_params)
            redirect_to coffee_path(@review.coffee)
        else
            @coffee = Coffee.find_by(id: params[:coffee_id])
            render :edit
        end 
    end

    private

    def review_params
        params.require(:review).permit(:content, :coffee_id)
    end

end
