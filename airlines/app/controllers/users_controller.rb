class UsersController < ApplicationController

  def index
    @options = [ 'none', 'manager', 'administrator', 'super' ]
    @users = User.all
  end

  def update
    us = User.find(params[:id])
    redirect_to controller: "users", action: "index"
  end

  def show
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    # Before filters

    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end

end
