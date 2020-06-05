Rails.application.routes.draw do
  devise_for :users
  root 'toppage#index'
  resources :items, only: :new
end
