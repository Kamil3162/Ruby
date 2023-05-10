Rails.application.routes.draw do
  get 'tags/index'
  get 'tags/show'
  get 'tags/new'
  get 'tags/destroy'
  resources :tags
  resources :products do
    resources :tags
  end
  resources :categories
  resources :products
  resources :shops, only:[:index, :show]
  resources :order_items, only: [:create, :update, :destroy]
  resource :card, only:[:show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "home", to: "home#hello"
  get "rejestracja", to: "registrations#new"
  post "rejestracja", to: "registrations#create"
  get "sing_in", to: "sessions#new"
  post "sing_in", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "/", to:"main#index", as: :root
end
