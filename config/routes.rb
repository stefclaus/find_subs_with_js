Rails.application.routes.draw do

  resources :assistants, only: [:index, :show, :create, :new]
  resources :yogaclasses
  resources :subrequests

  #one of these will be nested-- get ready for thata

  #will need the facebook authorization with this as well
  root 'welcome#home'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  post '/logout' => 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
