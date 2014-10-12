Rails.application.routes.draw do
  get 'welcome/index'


  resources :resources
 
  root 'welcome#index'



end
