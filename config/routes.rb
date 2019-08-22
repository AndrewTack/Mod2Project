Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :brands
  resources :campaigns
  resources :campaign_influencers
  resources :influencers

  root 'pages#index'

  get '/profile', to: 'influencers#profile', as: 'profile'
  #users was definitely wrong and not doing anything
  get '/profile/edit', to: 'influencers#edit', as: 'edit_profile'

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  #are all of these using Rails magic? what will happen if I try to make SEPARATE
  #profile/login/logout functionality for Influencers AND Brands?
  #let's find out...

  #may need jquery etc so none of this works, but the plan is to leave login/logout routes
  #since they flow through sessions controller
  #then make a separate path for brand profiles...

  # get '/profile_b', to: 'brands#profile_b', as: 'profile_b'
  # #users was definitely wrong and not doing anything
  # get '/profile_b/edit_b', to: 'brands#edit_b', as: 'edit_b_profile_b'
  get '/new_campaign', to: 'campaigns#new', as: 'new'
  get '/new_campaign_influencer', to: 'campaign_influencers#new', as: 'new_est'


end
