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
  post '/admin/add_user_to_team', to: 'admin#add_user_to_team'
  post '/admin/add_user_to_section', to: 'admin#add_user_to_section'
  post '/user/add_user_to_section', to: 'users#add_user_to_section'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
