Rails.application.routes.draw do
  get 'auth/google', as: 'login'
  get 'auth/:provider/callback', to: "sessions#create"
  get 'logout', to: "sessions#destroy"
  root "welcome#index"
  resources :students, only: [:show]

  namespace :teacher do
    get '/dashboard', to: "dashboard#show"
  end

  namespace :api do
    namespace :v1 do
      get 'teachers/:id/students', to: "teachers/students#index"
    end
  end
end
