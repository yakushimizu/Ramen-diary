Rails.application.routes.draw do

  devise_for :users
  get 'relationships/followings'
  get 'relationships/followers'

  resources :items, only: [:index, :show, :edit, :create, :destroy, :update, :new] do
    resource :favorites, only: [:create, :destroy]
    resources :item_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update, :index] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  
  #root to: "homes#top" トップページ未完成
  root to: "items#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
