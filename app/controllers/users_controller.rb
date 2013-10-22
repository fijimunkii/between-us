class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if User.where(email: params[:user][:email]).first.nil?
      @user = User.new params[:user]
      # @user.location = request.location SHOULD WORK WHEN LIVE
      if @user.save
        session[:user_id] = @user.id
        redirect_to "/users/#{@user.id}"
        flash[:notice] = "You have successfully created an account and have been logged in, #{@user.email}! "
      end
    else
      flash[:error] = "That username is already taken or your passwords do not match."
      @user = User.new
      render :new
    end
  end

  def show
    @user = User.find params[:id]
  end

  def update
    user = User.find params[:id]
    user.update_attributes params[:user]
    redirect_to user
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:notice] = "You have successfully deleted your account."
    session[:user_id] = nil
    redirect_to '/'
  end

end
