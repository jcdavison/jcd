Jcd::Application.routes.draw do

  resources :abbs
  root :to => 'abbs#index'

end