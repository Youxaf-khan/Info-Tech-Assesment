Rails.application.routes.draw do
  root 'pages#index'
  get 'pages/secret'
  resources :user_sessions, only: %i[new create]
  resources :users, only: %i[index new create]
end
