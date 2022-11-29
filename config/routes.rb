Rails.application.routes.draw do
  root 'top#index'

  get '/admin', to: 'admin/users#new'
  get '/auth/:provider/callback', to: 'sessions/twitter_sessions#create'
  post '/guest_login', to: 'sessions/guest_sessions#create'
  post '/admin_login', to: 'sessions/admin_sessions#create'
  delete '/logout', to: 'sessions/guest_sessions#destroy'
  delete '/logout', to: 'sessions/twitter_sessions#destroy'
  delete '/admin_logout', to: 'sessions/admin_sessions#destroy'

  namespace :admin do
    resources :users
  end

  namespace :users do
    resources :projects, param: :uuid do
      get 'analyze', to: 'analyze#show'
    end
    resource :profile, only: %i[show edit update]
  end
  
  resources :change_songs, only: %i[update]
  resource :search_songs, only: %i[create]
  resource :select_projects, only: %i[update]
  get '/select_songs', to: 'select_songs#select_song'
  get '/select_another_songs', to: 'select_another_songs#select_another_song'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
