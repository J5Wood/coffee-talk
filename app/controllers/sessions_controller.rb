class SessionsController < ApplicationController

    def new
        redirect_if_logged_in
        @user = User.new
    end

    def create
        user = User.where(name: params[:user][:name]).first
        if !!user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            @user = User.new
            render :new
        end
    end

    def destroy
        session.clear
        redirect_to "/"
    end
end