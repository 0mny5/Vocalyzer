Rails.application.routes.draw do
  root 'top#index'

  get '/auth/:provider/callback', to: 'sessions/twitter_sessions#create'
  post '/guest_sessions', to: 'sessions/guest_sessions#create'
  delete '/logout', to: 'sessions/session#destroy'


  resources :projects do
    get 'analyze/show'
  end
  resources :search_songs, only: %i[create]
  resources :select_songs, only: %i[create update]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
