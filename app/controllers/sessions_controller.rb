class SessionsController < ApplicationController

    def new
        redirect_if_logged_in
        @user = User.new
    end

    def create
        if !!auth
            @user = User.find_or_initialize_by(name: auth[:info][:nickname])
            @user.password = auth[:uid]
            if @user.save
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else
                render :new
            end
        else
            user = User.find_by(name: params[:user][:name])
            if !!user && user.authenticate(params[:user][:password])
                session[:user_id] = user.id
                redirect_to user_path(user)
            else
                @user = User.new
                render :new
            end
        end
    end

    def destroy
        session.clear
        redirect_to "/"
    end

    private

    def auth
        request.env['omniauth.auth']
    end
end