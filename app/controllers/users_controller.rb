class UsersController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:new]

    def new
        redirect_if_logged_in
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        find_current_user
    end

    def edit
        find_current_user
    end

    def update
        find_current_user
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            render :edit
        end
    end

    def destroy
        User.find_by(params[:id]).destroy
        session.clear
        redirect_to '/'
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :email, :password_confirmation)
    end

    def require_login
        if !session[:user_id]
            redirect_to '/'
        end
    end

    def find_current_user
        @user = User.find_by(id: session[:user_id])
    end

    def redirect_if_logged_in
        if !!session[:user_id]
            redirect_to '/'
        end
    end
end
