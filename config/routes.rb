Rails.application.routes.draw do

  root 'welcome#home'

  match '/app/github/callback', to: 'sessions#create', via: [:get, :post] 

  resources :lang_topics,  only: [:new, :create]
  resources :user_events,  only: [:new, :create]
  resources :events, only: [:index, :show, :new, :create, :delete]
  resources :topics, only: [:show, :new, :create]
  resources :languages, only: [:index, :show]
  resources :users,  only: [:new, :create, :delete]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end