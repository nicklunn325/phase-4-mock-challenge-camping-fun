Rails.application.routes.draw do
  resources :signouts
  resources :signins
  resources :signups, only: [:create]
  resources :campers, only: [:index, :show, :create]
  resources :activities, only: [:index, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
