Rails.application.routes.draw do
  get 'auth/google', as: 'teacher_login'
  get 'auth/:provider/callback', to: "teachers/sessions#create"
  get 'teacher_logout', to: "teachers/sessions#destroy"
  root "welcome#index"
  resources :students, only: [:show, :index]

  namespace :teacher do
    get '/dashboard', to: "dashboard#show"
  end

  namespace :api do
    namespace :v1 do
      get 'teachers/students', to: "teachers/students#index"
      delete 'teachers/students/:id', to: "teachers/students#destroy"
      post 'teachers/students', to: "teachers/students#create"
      patch 'teachers/students/:id', to: "teachers/students#update"
      get 'image', to: "images#show"
      post 'translation', to: "translations#show"
    end
  end
end
