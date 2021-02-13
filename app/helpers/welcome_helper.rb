module WelcomeHelper
    def login_check
        unless logged_in?
            "Please Login or Sign Up to View Coffees"
        end
    end
end
