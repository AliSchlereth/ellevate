Rails.application.routes.draw do
  get 'auth/google', as: 'login'
  get 'auth/:provider/callback', to: "sessions#create"
  get 'logout', to: "sessions#destroy"
  root "welcome#index"
  resources :students, only: [:show, :index]

  namespace :teacher do
    get '/dashboard', to: "dashboard#show"

  end

  namespace :api do
    namespace :v1 do
      get 'teachers/students', to: "teachers/students#index"
      delete 'teachers/students/:id', to: "teachers/students#destroy"
    end
  end
end
