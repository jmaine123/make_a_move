Rails.application.routes.draw do


devise_for :users do
  get '/logout' => 'devise/sessions#destroy'
end

  resources :movers do
    collection do
      # patch '/movers/:mover_id', to: 'movers#remove_mover'
      get 'remove_mover'
    end
    resources :reviews
  end

  resources :movees do
    resources :moving_events do
      resources :requests
    end
  end

  # get '/login' => 'sessions#new'
  # post '/login' => 'sessions#create'
  # get '/logout' => 'devise/sessions#destroy'
  # delete '/logout' => 'devise/sessions#destroy'

  root 'pages#home'
post '/movers/:mover_id/moving_events/new' => 'moving_events#create'
end
