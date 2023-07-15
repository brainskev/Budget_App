Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :categories do
    resources :payments
  end
  devise_for :users
  devise_scope :user do
    get '/logout', to: 'devise/sessions#destroy'
  end
  root to: 'user#index'
end
