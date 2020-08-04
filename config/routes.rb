Rails.application.routes.draw do
  devise_for :users,
    controllers: { registrations: 'registrations' }
  root "tweets#index"

  resources :users, only: [:index, :show]
  
  resources :groups, only: [:index, :new, :create, :edit, :update] do
    resources :messages, only: [:index, :create]
  end

  resources :tweets, only: [:index, :new, :create, :show, :destroy] do
    resources :photos, only: :create
    resources :likes, only: [:create, :destroy]
    resources :dislikes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

end
