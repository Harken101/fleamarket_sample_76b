Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  resources :users, only: [:edit, :update, :show]
  root 'toppage#index'
  resources :address, only: [:create,:edit, :update]
  resources :cards, only: [:create, :edit, :update]
  
  resources :items, only: [:new, :create, :show, :edit] do
    collection do
      get :buyscreen
      get :search
      get :search_two
    end
  end
end
