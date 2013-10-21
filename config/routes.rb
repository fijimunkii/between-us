BetweenUsApp::Application.routes.draw do

  get '/' => 'searches#new'

  resources :users do
    resources :searches
  end

end
