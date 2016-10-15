Rails.application.routes.draw do
  devise_for :views
  devise_for :users, controllers: {
        registrations: 'registration/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root :to => "pages#home"
 

  get 'pages/update_location' => 'pages#update_location'

  get 'negotiation/join' => 'negotiation#join'

  get 'negotiation/leave' => 'negotiation#leave'

  resources :negotiation
  post 'negotiation/new' => 'negotiation#create', as: 'negotiation2'

  post 'negotiation/new_message' => 'negotiation#new_message'



end
