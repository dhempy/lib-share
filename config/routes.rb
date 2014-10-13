Rails.application.routes.draw do

  resources :resources
 
  root 'resources#index'

end
