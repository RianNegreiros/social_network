Rails.application.routes.draw do
  devise_for :users, controllers: { registration: 'users/registration' }
  devise_for :admins, skip: [:registrations], controllers: { sessions: 'admins/sessions' }

  namespace :admin do
    root to: 'home#index'
    resources :admins
    resources :user, only: :index
    resources :post, only: [:index, :show]
  end

  root to: 'user/timeline#index'

  namespace :user do
    get 'profile', to: 'profile#show'
    get 'potencial_to_follow', to: 'profile#potenical_to_follow'
    resources :posts, only: :create

    post 'follow/:id', to: 'sbuscription#follow', as: :follow
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
