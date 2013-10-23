Yelp.configure(
  :yws_id          => ENV['YELP_YWSID'],
  :consumer_key    => ENV['YELP_CONSUMER_KEY'],
  :consumer_secret => ENV['YELP_CONSUMER_SECRET'],
  :token           => ENV['YELP_OAUTH_TOKEN'],
  :token_secret    => ENV['YELP_OAUTH_TOKEN_SECRET']
)
