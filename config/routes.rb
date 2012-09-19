Jcd::Application.routes.draw do

  devise_for :users
  resources :abbs
  resources :articles
  root :to => 'abbs#index'

end