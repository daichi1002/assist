Rails.application.routes.draw do
#法人会員ルーティング
  devise_for :companies, controllers: {
    sessions:      'companies/sessions',
    passwords:     'companies/passwords',
    registrations: 'companies/registrations'
  }

  devise_scope :company do
    post 'companies/guest_sign_in', to: 'companies/sessions#new_guest_company'
  end

  namespace :companies do
    resources :companies, only: [:show]
    post 'like/:id', to: 'likes#create', as: 'create_like'
    delete 'like/:id', to: 'likes#destroy', as: 'destroy_like'
    resources :articles, only: [:index, :show] do
      resources :comments, only: [:new, :create]
    end
    get 'matchings/search'
    resources :matchings
  end
  
#個人会員, 管理者ルーティング
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations',
    passwords:     'users/passwords',
    sessions: 'users/sessions',
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
    post 'users/admin_sign_in', to: 'users/sessions#new_admin'
  end

  resources :users, only: [:show]
  
  root to: 'articles#index'
  get 'articles/search'
  resources :articles, only: [:index, :show] do
    resources :comments, only: [:new, :create]
  end

  namespace :admin do
    resources :articles, only: [:new, :create, :show, :edit, :update, :destroy]
  end
  
  post 'like/:id', to: 'likes#create', as: 'create_like'
  delete 'like/:id', to: 'likes#destroy', as: 'destroy_like'

  get 'matchings/search'
  resources :matchings

#お問い合わせルーティング
  resource :contacts, only: [:new, :create] do
    get "/thanks", to: "contacts#thanks"
  end
end
