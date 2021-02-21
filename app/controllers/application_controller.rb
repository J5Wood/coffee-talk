class ApplicationController < ActionController::Base

    def route_not_found
        render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
    end
    
    private

    def redirect_if_logged_in
        if !!session[:user_id]
            redirect_to '/'
        end
    end

    def require_login
        if !session[:user_id]
            redirect_to '/'
        end
    end
end
