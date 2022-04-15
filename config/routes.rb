Rails.application.routes.draw do
  get 'static_pages/home'
  get 'admin/index'
  resources :courses
  resources :teams
  resources :projects
  resources :comments
  resources :scores
  resources :users
  root 'sessions#new'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/admin', to: 'admin#index'
  post '/admin/add_user_to_team', to: 'admin#add_user_to_team'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
