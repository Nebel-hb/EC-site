Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  # get 'unsubscribe/:name' => 'homes#unsubscribe', as: 'confirm_unsubscribe'
  # patch ':id/withdraw/:name' => 'homes#withdraw', as: 'withdraw_user'
  # put 'withdraw/:name' => 'users#withdraw'
  resources :users
  put "/users/:id/hide" => "users#hide", as: 'users_hide'

  resources :shops, only: [:new, :create, :index, :show, :destroy]
    namespace :admin do
      resources :shops, only: [:index, :new, :create, :show, :edit, :destroy]
    end

  # resources :post_images, only: [:new, :create, :index, :show, :destroy]
    # post 'shop' => 'admin/shops#new'
end
