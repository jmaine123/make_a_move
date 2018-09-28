Rails.application.routes.draw do

devise_for :users
  resources :movers do
    resources :users
    resources :reviews
  end
  resources :movees do
    resources :moving_events
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  root 'pages#home'
post '/movers/:mover_id/moving_events/new' => 'moving_events#create'
end
