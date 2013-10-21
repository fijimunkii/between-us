class SearchesController < ApplicationController

  def new
  end

  def create
    search = Search.new
    search.location = params[:location]
    # Geolocate.new location lat, long
  end

  def show
    @search = Search.find params[:id]
    @user = User.find params[:user_id]
  end

  def destroy
    Search.find(params[:id]).destroy
    redirect_to "/users#{params[:user_id]}/searches"
  end

end
