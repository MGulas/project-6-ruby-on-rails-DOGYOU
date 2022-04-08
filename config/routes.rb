Rails.application.routes.draw do
  resources :courses
  resources :teams
  resources :projects
  resources :comments
  resources :scores
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
