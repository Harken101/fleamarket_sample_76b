Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    # post 'new_users2', to: 'users/registrations#new_user2'
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  resources :users, only: [:edit, :update, :show]
  root 'items#index'
    resources :address, only: [:create,:edit, :update]
    resources :cards, only: [:create, :edit, :update]
  get "signup", to: "signup#index"
  resources :signup do
    collection do
      get 'step1' #ユーザー名とパスワード入力
      post 'step2' #本人確認情報入力
      post 'step3' #お届け先情報（address）を入力
      post 'complete_signup' # 登録完了後のページ
    end
  end
  
  resources :items  do
    collection do
      get :buyscreen
      get :search
      get :search_two
    end
  end
end
