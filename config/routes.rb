Jcd::Application.routes.draw do

  devise_for :users
  resources :articles
  match "remove_tag" => "articles#remove_tag"
  match "add_tags" => "articles#add_tags"
  match "Dev_Bootcamp_Mentorship_Program"  => "articles#show", :title  => "Dev_Bootcamp_Mentorship_Program"
  #resources :disruptions
  root :to => 'articles#index'

end
