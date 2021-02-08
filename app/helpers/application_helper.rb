module ApplicationHelper

    def logged_in?
        !!session[:user_id]
    end

    def navbar_options
        if logged_in?
            render partial: "layouts/logged_in_nav"
        else
            render partial: "layouts/signed_out_nav"
        end
    end
end
