class SearchesController < ApplicationController

  def create
    search = Search.create params[:search]
    redirect_to [search.user, search]
  end

  def show
    @search = Search.find params[:id]
    @user = User.find params[:user_id]

    mid_point_coords = Geocoder::Calculations.geographic_center([@user.location, @search.location])
    @mid_point = Geocoder.search(mid_point_coords)

    @miles_between = Geocoder::Calculations.distance_between(@user.location, @search.location)

    @locations = Array.new
    @locations << {
      "description" => "#{@user.location}",
      "lng" => "#{@user.longitude}",
      "lat" => "#{@user.latitude}"
    }
    @locations << {
      "description" => "#{@search.location}",
      "lng" => "#{@search.longitude}",
      "lat" => "#{@search.latitude}"
    }
    @locations << {
      "description" => "Midpoint - #{@mid_point[0].city}, #{@mid_point[0].state}",
      "lng" => "#{mid_point_coords[1]}",
      "lat" => "#{mid_point_coords[0]}"
    }
    @gmaps_json = @locations.to_json
  end

  def destroy
    Search.find(params[:id]).destroy
    redirect_to "/users/#{params[:user_id]}/"
  end

end
