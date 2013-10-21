BetweenUsApp::Application.routes.draw do

  get '/' => 'user#new'

  resources :users do
    resources :searches
  end

end
