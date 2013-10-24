class UsersController < ApplicationController

  def new
    if current_user
      redirect_to current_user
    end
    @user = User.new
  end

  def create
    if User.where(email: params[:user][:email]).first.nil?
      @user = User.new params[:user]
      @user.location = request.location
      if @user.save
        session[:user_id] = @user.id
        flash[:notice] = "You have successfully created an account and have been logged in, #{@user.email}! "
        redirect_to @user
      else
        flash[:error] = 'Your passwords did not match.'
        render :new
      end
    else
      flash[:error] = 'That username is already taken.'
      @user = User.new
      render :new
    end
  end

  def show
    @user = User.find params[:id]
    if current_user != @user
      flash[:error] = 'You do not have access to that page.'
      redirect_to '/'
    end
    @search = Search.new
    @gmaps_json = GmapsHelper.generate_previous_searches(@user)
  end

  def update
    user = User.find params[:id]
    user.update_attributes params[:user]
    flash[:notice] = 'Location updated.'
    redirect_to user
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:notice] = 'You have successfully deleted your account.'
    session[:user_id] = nil
    redirect_to '/'
  end

end
