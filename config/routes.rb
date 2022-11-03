Rails.application.routes.draw do
  root 'top#index'

  get '/auth/:provider/callback', to: 'sessions/twitter_sessions#create'
  post '/guest_login', to: 'sessions/guest_sessions#create'
  delete '/logout', to: 'sessions/session#destroy'


  namespace :users do
    resources :projects, param: :uuid do
      get 'analyze', to: 'analyze#show'
    end
    resource :profile, only: %i[show edit update]
  end
  resources :search_songs, only: %i[create]
  resource :select_songs, only: %i[update]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
