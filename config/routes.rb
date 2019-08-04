Rails.application.routes.draw do
  get 'sessions/new'

  get 'users/new'
  
  #homeのやつが、rootで表現されている
  root 'static_pages#home'
  get  '/help' => 'static_pages#help'
  get  '/about' =>'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new' 
  get    '/login',   to: 'sessions#new'  
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
 resources :users
 resources :account_activations, only: [:edit]
end