module GmapsHelper

  def self.generate_markers(user, search, mid_point, mid_point_coords)
    locations = Array.new
    locations << {
      "description" => user.location,
      "lng" => user.longitude,
      "lat" => user.latitude
    }
    locations << {
      "description" => search.location,
      "lng" => search.longitude,
      "lat" => search.latitude
    }
    locations << {
      "description" => "Between Us - #{mid_point[0].city}, #{mid_point[0].state}",
      "lng" => mid_point_coords[1],
      "lat" => mid_point_coords[0]
    }
    gmaps_json = locations.to_json

    output_json = {
      "markers" => { "data" => gmaps_json }
    }
  end

  def self.generate_directions(user, search, mid_point, mid_point_coords, user_preference)

    output_json = {
      "markers" => self.generate_markers(user, search, mid_point, mid_point_coords)['markers'],
      "direction" => {
        "data" => {
          "from" => user.location,
          "to" => mid_point[0].address
        },
        "options" => {
          "display_panel" => true,
          "panel_id" => "gmap_instructions"
        }
      }
    }

    case user_preference
    when 'user_directions_driving'
      output_json["direction"]["options"]["travelMode"] = "DRIVING"
    when 'user_directions_bicycling'
      output_json["direction"]["options"]["travelMode"] = "BICYCLING"
    when 'user_directions_walking'
      output_json["direction"]["options"]["travelMode"] = "WALKING"
    when 'user_directions_transit'
      output_json["direction"]["options"]["travelMode"] = "TRANSIT"
    end

    output_json

  end

end
