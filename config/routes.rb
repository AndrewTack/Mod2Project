Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :brands
  # resources :campaigns, only [:index]
  # resources :campaign_influencers, only [:index]
  # resources :influencers, only [:index]

  root 'pages#index'

end
