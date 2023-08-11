Rails.application.routes.draw do
  devise_for :users

  root 'posts#index'

  resources :posts, only: %i[index create destroy show] do
    resources :comments, only: %i[create]
  end

  resources :users, only: %i[show]

  get 'notifications', to: 'notifications#index'


end
