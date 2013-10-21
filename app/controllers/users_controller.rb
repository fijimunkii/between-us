class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if User.where(email: params[:user][:email]).first
      flash[:error] = "That email is already registered."
      render :new
    end
    @user = User.new params[:user]
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
      flash[:notice] = "You have successfully created an account and have been logged in, #{@user.email}! "
    else
      flash[:error] = "Your passwords do not match."
      render :new
    end
  end

  def show
    @user = User.find params[:id]
    @search = Search.new
  end

end
