Rails.application.routes.draw do
  get 'relationships/followings'
  get 'relationships/followers'
  resources :items, only: [:index, :show, :edit, :create, :destroy, :update] do
    resource :favorites, only: [:create, :destroy]
    resources :item_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  patch 'items/:id' => 'items#update', as: 'update_item'
  delete 'items/:id' => 'items#destroy', as: 'destroy_item'
  devise_for :users
  root to: "homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
