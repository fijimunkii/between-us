class SearchesController < ApplicationController

  def create
    search = Search.create params[:search]
    redirect_to [search.user, search]
  end

  def show
    @user = User.find params[:user_id]
    if current_user != @user
      flash[:error] = 'You do not have access to that page.'
      redirect_to '/'
    end

    @search = Search.find params[:id]

    mid_point_coords = Geocoder::Calculations.geographic_center([@user.location, @search.location])
    mid_point = Geocoder.search(mid_point_coords)
    @miles_between = Geocoder::Calculations.distance_between(@user.location, @search.location)

    @gmaps_json = GmapsHelper.generate_markers(@user, @search, mid_point, mid_point_coords)

    @yelp_response = YelpHelper.generate_json(mid_point)
  end

  def directions_request
    @user = User.find params[:user_id]
    if current_user != @user
      flash[:error] = 'You do not have access to that page.'
      redirect_to '/'
    end

    @search = Search.find params[:search_id]

    mid_point_coords = Geocoder::Calculations.geographic_center([@user.location, @search.location])
    mid_point = Geocoder.search(mid_point_coords)
    @miles_between = Geocoder::Calculations.distance_between(@user.location, @search.location)

    @gmaps_json = GmapsHelper.generate_directions(@user, @search, mid_point, mid_point_coords, params[:directions_request_type])

    @yelp_response = YelpHelper.generate_json(mid_point)

    render :show
  end

  def destroy
    Search.find(params[:id]).destroy
    redirect_to "/users/#{params[:user_id]}/"
  end

end
