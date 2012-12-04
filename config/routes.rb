Jcd::Application.routes.draw do

  devise_for :users
  resources :abbs
  resources :articles
  
  #resources :disruptions
  root :to => 'articles#index'
  match '/john_davison_is_really_a_great_roommate_and_this_is_why' => "articles#roommate"
  
  

end