Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :brands
  resources :campaigns
  resources :campaign_influencers
  resources :influencers

  root 'pages#index'

  get '/profile', to: 'influencers#profile', as: 'profile'
  get '/profile/edit', to: 'users#edit', as: 'edit_profile'

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

end
