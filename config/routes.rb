Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "sessions#new"
  resources :admins
  resources :customers
  resources :petros
  resources :fuels
  resources :calls
  resources :employees
  resources :stations
  get "/petros/:id/calltimes" => 'calltimes#new', :as => 'calltimes'
  get "/customer/search" => 'customers#search_customer', :as => 'search_customer'
  post "/customer/search" => 'customers#search', :as => 'searched_customer'
  post "/petros/:id/calltimes" => 'calltimes#create', :as => 'create_calltimes'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
end
