Rails.application.routes.draw do
  get 'users/new'
  
  #homeのやつが、rootで表現されている
  root 'static_pages#home'
  get  '/help' => 'static_pages#help'
  get  '/about' =>'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new' 
 resources :users
end