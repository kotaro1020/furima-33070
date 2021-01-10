Rails.application.routes.draw do
  devise_for :users
  get 'items/index'
  # devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "items#index"
  resources :items, only: :index do
  end
end