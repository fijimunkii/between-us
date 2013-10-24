module YelpHelper

  def self.generate_json(location_object)
    if location_object.length > 0
      client = Yelp::Client.new
      request = Yelp::V2::Search::Request::Location.new(
        :zipcode => location_object[0].postal_code,
        :limit => 10
      )
      response = client.search(request)
    else
      response = {
        'businesses' => [
          {
            "name" => "Yelp didn't have any results for this place.",
            "snippet_text" => 'Must not be much going on here..'
          }
        ]
      }
    end
  end

end
