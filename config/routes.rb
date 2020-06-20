Rails.application.routes.draw do
  # ビューを確認する為、仮のルーティングを作成
  root "tweets#index"
  resources :tweets, only: :index
end
