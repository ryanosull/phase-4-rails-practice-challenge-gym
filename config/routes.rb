Rails.application.routes.draw do
  resources :gyms, only: [:show, :index, :update, :destroy]
  resources :clients, only: [:show, :index, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post '/new_member', to: 'gyms#new_membership'



end
