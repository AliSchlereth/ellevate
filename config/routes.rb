Rails.application.routes.draw do
  root "welcome#index"
  resources :students, only: [:show]
end
