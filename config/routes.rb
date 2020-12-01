Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  
  root to: 'articles#index'
  resources :articles, only: [:index, :show]
    namespace :admin do
      resources :articles, only: [:new, :create, :show, :edit, :update, :destroy]
    end
end
