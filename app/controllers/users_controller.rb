class UsersController < ApplicationController

    def show
        @user = User.find_by(id: session[:user_id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if !User.find_by(name: params[:user][:name]) && @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def edit
        @user = User.find_by(id: params[:id])
    end

    def update
        @user = User.find_by(id: params[:id])
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            render :edit
        end

    end

    def destroy
        User.find_by(params[:id]).destroy
        redirect_to '/'
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :email)
    end
end
