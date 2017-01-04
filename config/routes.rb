Rails.application.routes.draw do
  get 'auth/google', as: 'login'
  get 'auth/:provider/callback', to: "sessions#create"
  get 'logout', to: "sessions#destroy"
  root "welcome#index"
  resources :students, only: [:show]

  namespace :teacher do
    get '/dashboard', to: "dashboard#show"
  end
end
