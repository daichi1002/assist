Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resources :users, only: [:show]
  
  root to: 'articles#index'
  get 'articles/search'
  resources :articles, only: [:index, :show]
    namespace :admin do
      resources :articles, only: [:new, :create, :show, :edit, :update, :destroy]
    end
  
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
end
