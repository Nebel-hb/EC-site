Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }
   resources :users
  
  root to: "homes#top"
  get 'mypage/:name', to: 'homes#mypage', as: 'mypage'

  get 'unsubscribe/:name' => 'homes#unsubscribe', as: 'confirm_unsubscribe'
  patch ':id/withdraw/:name' => 'homes#withdraw', as: 'withdraw_user'
  put 'withdraw/:name' => 'users#withdraw'

  resources :shops, only: [:new, :create, :index, :show, :destroy]
    namespace :admin do
    resources :shops, only: [:index, :new, :create, :show,  :edit, :destroy]
  end
end
