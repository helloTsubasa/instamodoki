Rails.application.routes.draw do
  root "tweets#index" # ビューを確認する為、仮のルーティングを作成
  resources :tweets, only: :index
end
