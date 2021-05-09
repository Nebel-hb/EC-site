Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  resources :shops, only: [:new, :create, :index, :show, :destroy]
    namespace :admin do
    resources :shops, only: [:index, :new, :create, :show,  :edit, :destroy]
  end
end
