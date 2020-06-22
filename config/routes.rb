Rails.application.routes.draw do
  devise_for :users
  root "tweets#index" # ビューを確認する為、仮のルーティングを作成
  resources :tweets, only: [:index, :new]
end
