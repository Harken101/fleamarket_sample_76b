Rails.application.routes.draw do
  get 'purchase/index'
  get 'purchase/done'
  get 'card/new'
  get 'card/show'
  devise_for :users
  resources :users, only: [:edit, :update, :show]
  root 'toppage#index'
    resources :address, only: [:create,:edit, :update]
  get "signup", to: "signup#index"
  resources :signup do
    collection do
      get 'step1' #ユーザー名とパスワード入力
      post 'step2' #本人確認情報入力
      post 'step3' #お届け先情報（address）を入力
      post 'complete_signup' # 登録完了後のページ
    end
  end

  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end

  resources :purchase, only: [:index] do
    collection do
      get 'index', to: 'purchase#index'
      post 'pay', to: 'purchase#pay'
      get 'done', to: 'purchase#done'
    end
  end
  
  resources :items, only: [:new, :create, :show] do
    collection do
      get :buyscreen
    end
  end
end
