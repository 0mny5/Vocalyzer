Rails.application.routes.draw do
  root 'top#index'
  get 'analyze/index'
  get '/auth/:provider/callback', to: 'sessions/twitter_sessions#create'
  post '/guest_sessions', to: 'sessions/guest_sessions#create'
  get '/logout', to: 'sessions/twitter_sesions#destroy'
  resources :songs
  resources :projects do
    resource :select_songs, only: %i[update show]
    get 'analyze/show'
  end
  resources :search_songs
  resources :select_songs, only: %i[create update]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
