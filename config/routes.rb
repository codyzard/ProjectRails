Rails.application.routes.draw do
  get 'sessions/new'
  root 'users#index'
  
  get '/users/:id' => 'users#show', as: :user
  # get 'users/new'
  get '/users/:id/edit' => 'users#edit'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  
  resources :users 
   
  get '/search' => 'pages#search', :as => 'search_page'

end
