Rails.application.routes.draw do
  devise_for :users

  root 'posts#index'

  resources :posts, only: %i[index create destroy show] do
    resources :comments, only: %i[create]
    resources :likes, only: %i[create destroy]
  end

  resources :users, only: %i[show]

  get '/likes_list/:id/', to: 'posts#likes_list', as: 'likes_list'

  get 'notifications', to: 'notifications#index'
  post 'clear_notifications', to: 'notifications#clear_notifications', as: 'clear_notifications'
  delete 'notifications/:id', to: 'notifications#destroy', as: 'delete_notification'


end
