yelp_config = YAML.load(File.read(Rails.root.join('config', 'yelp.yml')))[Rails.env]

Yelp.configure(
  :yws_id          => yelp_config['ywsid'],
  :consumer_key    => yelp_config['consumer_key'],
  :consumer_secret => yelp_config['consumer_secret'],
  :token           => yelp_config['oauth_token'],
  :token_secret    => yelp_config['oauth_token_secret']
)
