Rails.application.routes.draw do
  devise_for :users
  root to: 'articles#index'
  resources :articles, only: [:index, :show]
    namespace :admin do
      resources :articles, only: [:new, :create, :show, :edit, :update, :destroy]
    end
end
