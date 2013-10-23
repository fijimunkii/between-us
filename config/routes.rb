BetweenUsApp::Application.routes.draw do

  get '/' => 'users#new'

  get '/signup' => 'users#new'
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  get '/logout' => 'session#destroy'

  resources :users do
    resources :searches do
      get '/:directions_request_type' => 'searches#directions_request'
    end
  end

end
