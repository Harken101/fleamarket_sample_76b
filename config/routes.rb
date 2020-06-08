Rails.application.routes.draw do
  devise_for :users
  root 'toppage#index'
  resources :items, only: [:new, :show] do
    collection do
      get :buyscreen
    end
  end
end
