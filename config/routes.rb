Rails.application.routes.draw do

  root 'sessions#new'

  get 'welcome', to: 'welcome#home'

  get 'sessions', to: 'sessions#destroy'

  put 'event/:id/join', to: 'events#join', as: 'join'

  resources :sessions

  # match '/app/github/callback', to: 'sessions#create', via: [:get, :post] 

  resources :lang_topics,  only: [:new, :create]
  resources :user_events,  only: [:new, :create]
  resources :events, only: [:index, :show, :new, :create, :delete]
  resources :topics, only: [:show, :new, :create]
  resources :languages, only: [:index, :show]
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end