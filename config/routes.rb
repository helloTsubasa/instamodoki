Rails.application.routes.draw do
  devise_for :users,
    controllers: { registrations: 'registrations' }
  root "tweets#index" # ビューを確認する為、仮のルーティングを作成
  resources :tweets, only: [:index, :new]
  resources :users, only: :show
end
