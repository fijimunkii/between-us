module YelpHelper

  def self.generate_json(location_object)
    client = Yelp::Client.new
    request = Yelp::V2::Search::Request::Location.new(
      :zipcode => location_object[0].postal_code,
      :limit => 10
    )
    response = client.search(request)
  end

end
