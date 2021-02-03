class ApplicationController < ActionController::Base
    private

    def redirect_if_logged_in
        if !!session[:user_id]
            redirect_to '/'
        end
    end
end
