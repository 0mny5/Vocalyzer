Rails.application.routes.draw do
  get 'analyze/index'
  resources :songs
  resources :projects do
    resource :select_songs, only: %i[update show]
    get 'analyze/show'
  end
  resources :song_searches
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
