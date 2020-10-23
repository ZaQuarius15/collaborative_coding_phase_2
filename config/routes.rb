Rails.application.routes.draw do

  root 'sessions#new'

  get 'welcome', to: 'welcome#home'

  get 'sessions', to: 'sessions#destroy'

  put 'event/:id/join', to: 'events#join', as: 'join'

  delete 'event/:id/cancel_join', to: 'events#cancel_join', as: 'cancel_join'

  resources :sessions

  # match '/app/github/callback', to: 'sessions#create', via: [:get, :post] 

  resources :lang_topics,  only: [:new, :create]
  resources :user_events,  only: [:new, :create, :destroy]
  resources :events
  resources :topics, only: [:show, :new, :create]
  resources :languages, only: [:index, :show]
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end