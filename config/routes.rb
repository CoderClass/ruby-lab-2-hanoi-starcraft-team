Rails.application.routes.draw do
  resources :sessions, only: [:new, :create]

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'

  root 'welcome#index'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
