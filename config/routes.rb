Rails.application.routes.draw do
  devise_scope :user do
    root to: "home#home"
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks',
  }

  resources :users, only: [:index, :show]

  # パスワード変更ページ
  get   '/edit_password'   => 'users#edit_password'
  patch '/update_password' => 'users#update_password'
  put   '/update_password' => 'users#update_password'

  # ログイン前ページ
  get '/policy'  => 'home#policy'
  get '/contact' => 'home#contact'
end
