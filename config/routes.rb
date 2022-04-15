Rails.application.routes.draw do
  get 'static_pages/home'
  get 'admin/index'
  resources :courses
  resources :teams
  resources :projects
  resources :comments
  resources :scores
  resources :users
  root 'static_pages#home'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/admin', to: 'admin#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
