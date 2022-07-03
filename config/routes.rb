Rails.application.routes.draw do
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  resources :articles do
    resources :comments
  end
  
  root "articles#index"

  get 'sign_in' => "sessions#new"
  post 'sign_in' => "sessions#create"
  delete "sign_out" => "sessions#destroy"
  # Defines the root path route ("/")
end
