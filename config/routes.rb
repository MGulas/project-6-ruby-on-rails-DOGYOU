Rails.application.routes.draw do
  resources :courses
  resources :teams
  resources :projects
  resources :comments
  resources :scores
  resources :users
  root 'application#hello'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
