Rails.application.routes.draw do
  devise_for :users, controllers: { registration: 'users/registration' }
  devise_for :admins, skip: [:registrations], controllers: { sessions: 'admins/sessions' }

  namespace :admin do
    root to: 'home#index'
    resources :admins
    resources :user, only: :index
  end

  root to: 'user/timeline#index'

  namespace :user do
    get 'profile', to: 'profile#show'
    resources :posts, only: :create
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
