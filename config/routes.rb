Jcd::Application.routes.draw do

  devise_for :users
  resources :abbs
  resources :articles
  
  match '/disruptive_innovation_survey' => "disruptions#new"
  match '/thanks' => "disruptions#thanks"
  match '/disruptions' => 'disruptions#create', :via => [:post]
  #resources :disruptions
  root :to => 'abbs#index'
  

end