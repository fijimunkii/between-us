class SearchesController < ApplicationController

  def create
    search = Search.create params[:search]
    redirect_to [search.user, search]
  end

  def show
    @search = Search.find params[:id]
    @user = User.find params[:user_id] # TODO refactor to current_user

    mid_point_coords = Geocoder::Calculations.geographic_center([@user.location, @search.location])
    @mid_point = Geocoder.search(mid_point_coords)
    @miles_between = Geocoder::Calculations.distance_between(@user.location, @search.location)

    @gmaps_json = GmapsHelper.generate_markers(@user, @search, @mid_point, mid_point_coords)

    @yelp_response = YelpHelper.generate_json(@mid_point)
  end

  def directions_request
    @user = User.find params[:user_id]
    @search = Search.find params[:search_id]

    mid_point_coords = Geocoder::Calculations.geographic_center([@user.location, @search.location])
    @mid_point = Geocoder.search(mid_point_coords)
    @miles_between = Geocoder::Calculations.distance_between(@user.location, @search.location)

    @yelp_response = YelpHelper.generate_json(@mid_point)

      # TODO implement directions booleans
      # avoidHighways: boolean
      # avoidTolls : boolean
      # unitSystem : string, "IMPERIAL" or "METRIC"

    @gmaps_json = GmapsHelper.generate_directions(@user, @search, @mid_point, mid_point_coords, params[:directions_request_type])
    render :show
  end

  def destroy
    Search.find(params[:id]).destroy
    redirect_to "/users/#{params[:user_id]}/"
  end

end
