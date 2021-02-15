module ReviewsHelper

    def user_review_options(review, coffee)
        if review.user_id == session[:user_id]
            render partial: "reviews/user_options", locals: {coffee: coffee, review: review}
        end
    end
end
