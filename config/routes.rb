Rails.application.routes.draw do
  
  root "welcome#home"

  get "login" => "sessions#new"
  post "login" => "sessions#create"
  post "logout" => "sessions#destroy"
  get '/auth/:provider/callback', to: 'sessions#create'

  resources :coffees do
    resources :reviews, only: [:new, :edit]
  end
  
  resources :reviews, only: [:create, :update, :destroy]

  resources :brands do
    resources :coffees, only: [:new, :show]
  end
  
  resources :users, except: :index

  match '*unmatched', to: 'application#route_not_found', via: :all

end
