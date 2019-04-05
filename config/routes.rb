Rails.application.routes.draw do
  root 'static_pages#home'
  get 'help'  =>  'static_pages#help'
  
  get 'sessions/new'
  # get  'users/index'
  
  get '/users/:id' => 'users#show', as: :user
  # get 'users/new'
  get '/users/:id/edit' => 'users#edit'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  
  resources :users do
    member do
      get :following, :followers
    end
  end
   
  get '/search' => 'pages#search', :as => 'search_page'
  
  resources :relationships, only: [:create, :destroy] 
end
