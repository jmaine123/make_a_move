Rails.application.routes.draw do
  resources :movers
  resources :movees do
    resources :moving_events
  end

  root 'pages#home'
post '/movees/:movee_id/moving_events/new' => 'moving_events#create'
end
