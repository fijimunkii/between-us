BetweenUsApp::Application.routes.draw do

  get '/' => 'users#new'

  get '/signup' => 'users#new'
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  get '/logout' => 'session#destroy'

  resources :users do
    resources :searches #, except: [:index, :new, :edit, :update]
  end

  post '/users/:user_id/searches/:id/user_directions_driving' => 'searches#user_directions_driving'

end
