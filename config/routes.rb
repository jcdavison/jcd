Jcd::Application.routes.draw do

  devise_for :users
  resources :articles
  match "remove_tag" => "articles#remove_tag"
  match "add_tags" => "articles#add_tags"
  match "/:title", to: 'articles#show'
  #resources :disruptions
  root :to => 'articles#index'

end
