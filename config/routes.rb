Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root 'top#index'

  get '/privacy', to: 'policy#privacy'
  get '/admin', to: 'admin/sessions#new'
  get '/auth/:provider/callback', to: 'sessions/twitter_sessions#create'
  post '/guest_login', to: 'sessions/guest_sessions#create'
  post '/admin_login', to: 'admin/sessions#create'
  delete '/logout', to: 'sessions/guest_sessions#destroy'
  delete '/logout', to: 'sessions/twitter_sessions#destroy'
  delete '/admin_logout', to: 'admin/sessions#destroy'

  namespace :admin do
    resources :users
  end

  resources :users, only: %i[update]

  namespace :users do
    resources :projects, param: :uuid do
      get 'analyze', to: 'analyze#show'
      get 'analyze_another', to: 'analyze_another#show'
    end
    resource :profile, only: %i[show edit update]
  end

  resources :contacts, only: %i[new, create]
  
  resources :change_songs, only: %i[update]
  resource :search_songs, only: %i[create]
  resource :select_projects, only: %i[update]
  get '/select_songs', to: 'select_songs#select_song'
  get '/select_another_songs', to: 'select_another_songs#select_another_song'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
