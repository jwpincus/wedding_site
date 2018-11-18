Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get 'dashboard', to: 'admin#index'
  get 'rsvp', to: 'guests#edit'

  namespace :admin do
    resources :guests
    resources :messages
  end

  resources :guests, only: [:update]

end
