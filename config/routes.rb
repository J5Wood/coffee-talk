Rails.application.routes.draw do
  
  root "welcome#home"

  get "login" => "sessions#new"
  post "login" => "sessions#create"
  post "logout" => "sessions#destroy"
  
  resources :coffees do
    resources :reviews, only: [:new, :edit]
  end
  
  resources :brands
  
  resources :users, except: :index
end
