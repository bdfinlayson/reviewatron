Rails.application.routes.draw do
  devise_for :users
  root 'acts#new'
  resources :acts
  resources :previews, only: [:create]
  resources :reports, only: [:index]
end
