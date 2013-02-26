Jcd::Application.routes.draw do

  devise_for :users
  resources :abbs
  resources :articles
  match "remove_tag" => "articles#remove_tag"
  #resources :disruptions
  root :to => 'articles#index'

end
