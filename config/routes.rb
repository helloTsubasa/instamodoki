Rails.application.routes.draw do
  devise_for :users,
    controllers: { registrations: 'registrations' }
  root "tweets#index" # ビューを確認する為、仮のルーティングを作成

  resources :users, only: :show

  resources :tweets, only: [:index, :new, :create] do
    resources :photos, only: :create
  end

end
