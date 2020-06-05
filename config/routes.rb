Rails.application.routes.draw do
  devise_for :users
  resources :signup do
    collection do
      get 'step1' #ユーザー名とパスワード入力
      get 'step2' #本人確認情報入力
      get 'step3' #お届け先情報（address）を入力
      get 'step4' # カード情報
      get 'done' # 登録完了後のページ
    end
  end
  resources :users, only: [:edit, :update]
  root 'toppage#index'
end
