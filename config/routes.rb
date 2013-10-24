BetweenUsApp::Application.routes.draw do

  get '/' => 'users#new'

  get '/signup' => 'users#new'
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  get '/logout' => 'session#destroy'

  resources :users, except: [:edit, :index] do
    # get '/geolocate' => 'users#geolocate'
    # get '/geolocator' => 'users#geolocator'
    resources :searches, except: [:index, :new, :edit, :update] do
      get '/yelp' => 'searches#yelp_request'
      get '/:directions_request_type' => 'searches#directions_request'
    end
  end

end
