Rails.application.routes.draw do

  resources :assistants, only: [:index, :show, :create, :new]

  resources :yogaclasses, only: [:show, :index] do
    resources :subrequests, only: [:show, :index, :new]
  end

  #resources :yogaclasses, only: [:index, :edit, :new]
  resources :subrequests, only: [:index, :show, :new, :create, :edit, :update]

  #get '/auth/facebook/callback', to:  'sessions#fbcreate'
  #get '/categories/:id/next', to: 'categories#next'

  #
  #one of these will be nested-- get ready for thata

  #will need the facebook authorization with this as well
  root 'welcome#home'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  post '/logout' => 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#fbcreate'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
