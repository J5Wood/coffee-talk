Rails.application.routes.draw do
  
  root "welcome#home"

  get "login" => "sessions#create"
  
  resources :coffees do
    resources :reviews, only: [:new, :edit]
  end
  
  resources :brands
  
  resources :users, except: :index
end
