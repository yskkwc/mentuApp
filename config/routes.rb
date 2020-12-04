Rails.application.routes.draw do
  devise_scope :user do
    root to: "home#top"
  end

  devise_for :users, controllers: {
    sessions:           'users/sessions',
    passwords:          'users/passwords',
    registrations:      'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
end
