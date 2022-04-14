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
    get 'potential_to_follow', to: 'profile#potential_to_follow'
    get 'following', to: 'profile#following'
    get 'followers', to: 'profile#followers'
    resources :posts, only: [:create, :destroy] do
      member do
        post :like_toggle
      end
    end
    resources :users, only: :show

    post 'follow/:id', to: 'subscription#follow', as: :follow
    post 'unfollow/:id', to: 'subscription#unfollow', as: :unfollow
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
