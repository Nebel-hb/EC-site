Rails.application.routes.draw do
  get 'users/users'
  devise_for :users
  root to: "homes#top"
  get "/about" => "homes#about"

  resources :carts, only: [:show]

  post '/add_item' => 'carts#add_item'
  post '/update_item' => 'carts#update_item'
  delete '/delete_item' => 'carts#delete_item'

  scope module: :users do
    delete "/cart_items/destroy_all" => "cart_items#destroy_all"
    resources :cart_items,only:[:index,:update,:create,:destroy]
    resource :users,only:[:edit,:update,]
    get "/users/mypage" => "users#show"
    get "/users/unsubscribe" => "users#unsubscribe"
    post "/orders/confirm" => "orders#confirm"
    get "/orders/confirm" => "orders#confirm"
    get "orders/complete" => "orders#complete"
    resources :orders,only:[:new,:create,:index,:show]

  end

  resources :shops, only: [:new, :create, :index, :show, :destroy]
    namespace :admin do
    resources :shops, only: [:index, :new, :create, :show,  :edit, :destroy]
  end

  namespace :admin do
    resources :genres,only:[:index,:create,:edit,:update]
    resources :users,only:[:index,:show,:edit,:update]
  end
 end