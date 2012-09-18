Jcd::Application.routes.draw do

  devise_for :users
  match '/coderay' => "articles#coderay"
  resources :abbs
  resources :articles
  root :to => 'abbs#index'

end