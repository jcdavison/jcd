Jcd::Application.routes.draw do

  devise_for :users
  resources :abbs
  resources :articles
  
  #resources :disruptions
  root :to => 'articles#index'
  

end