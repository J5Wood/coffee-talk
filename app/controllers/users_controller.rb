class UsersController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:new, :create]

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
        find_and_verify_current_user
    end

    def edit
        find_and_verify_current_user
    end

    def update
        find_and_verify_current_user
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            render :edit
        end
    end

    def destroy
        find_user.destroy
        session.clear
        redirect_to '/'
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end

    def find_and_verify_current_user
        @user = User.find_by(id: params[:id])
        if @user.id != session[:user_id]
            redirect_to "/"
        end
    end

    def find_user
        User.find_by(id: params[:id])
    end
end
