Rails.application.routes.draw do
  
  root "welcome#home"

  get "login" => "sessions#new"
  post "login" => "sessions#create"
  post "logout" => "sessions#destroy"
  
  resources :coffees do
    resources :reviews, only: [:new, :edit]
  end
  
  resources :reviews, only: [:create, :update]

  resources :brands do
    resources :coffees, only: [:new, :edit]
  end
  
  resources :users, except: :index
end
