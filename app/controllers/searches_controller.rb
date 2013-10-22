class SearchesController < ApplicationController

  def index
    @searches = Search.where(user_id = params[:user_id])
  end

  def new

  end

  def create
    search = Search.new
    search.location = params[:location]
    search.user_id = params[:user_id]
    if search.save
      redirect_to "/users/#{params[:user_id]}/searches/#{search.id}"
    else
      flash[:error] = "Unfortunately something did not work.."
    end
  end

  def show
    @search = Search.find params[:id]
    @user = User.find params[:user_id]
  end

  def destroy
    Search.find(params[:id]).destroy
    redirect_to "/users/#{params[:user_id]}/"
  end

end
