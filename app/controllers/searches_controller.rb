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

    @gmap_default = {
      "markers" => { "data" => @gmaps_json }
    }

    client = Yelp::Client.new
    request = Yelp::V2::Search::Request::Location.new(
      :zipcode => @mid_point[0].postal_code,
      :limit => 10
    )
    @yelp_response = client.search(request)

  end

  def destroy
    Search.find(params[:id]).destroy
    redirect_to "/users/#{params[:user_id]}/"
  end

  def user_directions_driving
    @user = User.find params[:user_id]
    @search = Search.find params[:id]

    mid_point_coords = Geocoder::Calculations.geographic_center([@user.location, @search.location])
    @mid_point = Geocoder.search(mid_point_coords)

    @miles_between = Geocoder::Calculations.distance_between(@user.location, @search.location)

    @gmap_default = {
      "markers" => { "data" => @gmaps_json }
    }
    gmap_directions_user = @gmap_default
    gmap_directions_user["direction"] = {
      "data" => {
        "from" => @user.location,
        "to" => @mid_point[0].address
      },
      "options" => {
        "display_panel" => true,
        "panel_id" => "gmap_instructions"
      }
    }

    @gmap_directions_user_car = gmap_directions_user
    @gmap_directions_user_car["direction"]["options"]["travelMode"] = "DRIVING"


    respond_to do |format|
      format.js
    end
  end

  def user_directions_walking
    @user = User.find params[:user_id]
    @search = Search.find params[:id]

    mid_point_coords = Geocoder::Calculations.geographic_center([@user.location, @search.location])
    @mid_point = Geocoder.search(mid_point_coords)

    @miles_between = Geocoder::Calculations.distance_between(@user.location, @search.location)

    @gmap_default = {
      "markers" => { "data" => @gmaps_json }
    }
    gmap_directions_user = @gmap_default
    gmap_directions_user["direction"] = {
      "data" => {
        "from" => @user.location,
        "to" => @mid_point[0].address
      },
      "options" => {
        "display_panel" => true,
        "panel_id" => "gmap_instructions"
      }
    }

    @gmap_directions_user_walking = gmap_directions_user
    @gmap_directions_user_walking["direction"]["options"]["travelMode"] = "WALKING"

    respond_to do |format|
      format.js
    end
  end

  def user_directions_bicycling
    @user = User.find params[:user_id]
    @search = Search.find params[:id]

    mid_point_coords = Geocoder::Calculations.geographic_center([@user.location, @search.location])
    @mid_point = Geocoder.search(mid_point_coords)

    @miles_between = Geocoder::Calculations.distance_between(@user.location, @search.location)

    @gmap_default = {
      "markers" => { "data" => @gmaps_json }
    }
    gmap_directions_user = @gmap_default
    gmap_directions_user["direction"] = {
      "data" => {
        "from" => @user.location,
        "to" => @mid_point[0].address
      },
      "options" => {
        "display_panel" => true,
        "panel_id" => "gmap_instructions"
      }
    }

    @gmap_directions_user_bicycling = gmap_directions_user
    @gmap_directions_user_bicycling["direction"]["options"]["travelMode"] = "BICYCLING"

    respond_to do |format|
      format.js
    end
  end

  def user_directions_transit
    @user = User.find params[:user_id]
    @search = Search.find params[:id]

    mid_point_coords = Geocoder::Calculations.geographic_center([@user.location, @search.location])
    @mid_point = Geocoder.search(mid_point_coords)

    @miles_between = Geocoder::Calculations.distance_between(@user.location, @search.location)

    @gmap_default = {
      "markers" => { "data" => @gmaps_json }
    }
    gmap_directions_user = @gmap_default
    gmap_directions_user["direction"] = {
      "data" => {
        "from" => @user.location,
        "to" => @mid_point[0].address
      },
      "options" => {
        "display_panel" => true,
        "panel_id" => "gmap_instructions"
      }
    }

    @gmap_directions_user_transit = gmap_directions_user
    @gmap_directions_user_transit["direction"]["options"]["travelMode"] = "TRANSIT"

    respond_to do |format|
      format.js
    end
  end

end
