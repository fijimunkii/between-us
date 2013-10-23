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

  def directions_request

    @user = User.find params[:user_id]
    @search = Search.find params[:id]

    mid_point_coords = Geocoder::Calculations.geographic_center([@user.location, @search.location])
    @mid_point = Geocoder.search(mid_point_coords)

    @miles_between = Geocoder::Calculations.distance_between(@user.location, @search.location)


    client = Yelp::Client.new
    request = Yelp::V2::Search::Request::Location.new(
      :zipcode => @mid_point[0].postal_code,
      :limit => 10
    )
    @yelp_response = client.search(request)



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

    gmap_directions_user = {
      "markers" => { "data" => @gmaps_json }
    }

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

    case params[:directions_request]
    when 'user_directions_driving'
      @gmap_default = gmap_directions_user
      @gmap_default["direction"]["options"]["travelMode"] = "DRIVING"
      render :show
    when 'user_directions_bicycling'
      @gmap_default = gmap_directions_user
      @gmap_default["direction"]["options"]["travelMode"] = "BICYCLING"
      render :show
    when 'user_directions_walking'
      @gmap_default = gmap_directions_user
      @gmap_default["direction"]["options"]["travelMode"] = "WALKING"
      render :show
    when 'user_directions_transit'
      @gmap_default = gmap_directions_user
      @gmap_default["direction"]["options"]["travelMode"] = "TRANSIT"
      render :show
    end

  end

end
